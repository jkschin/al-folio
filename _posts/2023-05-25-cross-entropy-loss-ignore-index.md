---
layout: post
title: Intricacies of nn.CrossEntropyLoss Ignore Index and Gradients
date: 2023-05-25 11:59:00-0400
description: A deep dive into ignore index and how it affects the gradients.
categories: code
disqus_comments: false
related_posts: false
toc:
  sidebar: left
---

## Introduction

In machine learning, PyTorch's `nn.CrossEntropyLoss` is an often-utilized function.
It combines `nn.LogSoftmax()` and `nn.NLLLoss()` in one single class to compute the cross-entropy loss between the predicted and actual labels.
The CrossEntropyLoss function offers an optional parameter called `ignore_index` that can be used to ignore the loss contribution from some specific classes and is widely used in NLP, where padding of a sequence is necessary.
This post delves into the intricacies of this mechanism and how it affects gradients in backpropagation.
I was using `ignore_index` and ran into an issue with `nan` values after the first optimization step and had to dive deeper into the issue.
As with all code debugging nowadays (and writing), I used ChatGPT to assist me in writing this post.

## Context

I was training a GPT based model and the final output is postprocessed with a mask.
In a classic GPT language model, you simply softmax over the vocabulary and it outputs the relevant token.
However, I wanted to mask out some parts of the vocabulary and thus created a mask with `-inf` values.
For convenience, I also masked out all the irrelevant tokens with `-inf` that are not included in the ground truth and also set their relevant class to -1 and set `ignore_index = -1` accordingly.
Here's a sample mask:

```console
tensor([[0., 0., -inf, -inf, -inf, -inf],
        [0., 0., -inf, -inf, -inf, -inf],
        [-inf, -inf, -inf, -inf, -inf, -inf],
        [-inf, -inf, -inf, -inf, -inf, -inf],
        [-inf, -inf, -inf, -inf, -inf, -inf]])
```

I started training my model and the loss was a reasonable float value on the first step, but became `nan` in the second step.
This prompted my deep dive.
The TLDR here is that in the example mask above, you can mask the first two columns with `-inf` as that's what you want, but from the third column onwards, mask with 0.

## A Simple Example

We start with a basic example.
We first create an input tensor and a target tensor.
We enable gradients for the input tensor and set the `ignore_index` to -1 as an argument for the `CrossEntropyLoss`.
After computing the loss, we perform a backward pass and print the gradients:

```python
import torch
import torch.nn as nn

# Define the input tensor and target tensor

input_tensor = torch.ones(3, 5)
input_tensor.requires_grad = True
target_tensor = torch.tensor([1, 2, -1]) # Assuming ignore_index is -1

# Create the CrossEntropyLoss criterion with ignore_index

criterion = nn.CrossEntropyLoss(ignore_index=-1)

# Compute the loss

loss = criterion(input_tensor, target_tensor)

# Print the loss

print("Loss:", loss.item())

# Perform the backward pass

loss.backward()

# Print the gradients

print("Gradients:")
print(input_tensor.grad)
```

```console
Output:
Loss: 1.6094379425048828
Gradients:
tensor([[0.1000, -0.4000,  0.1000,  0.1000,  0.1000],
        [ 0.1000,  0.1000, -0.4000,  0.1000,  0.1000],
        [ 0.0000,  0.0000,  0.0000,  0.0000,  0.0000]])
```

Observe here that the gradients are indeed 0 for the third row, as the `target_tensor` has `-1` as the third element (or second if 0-indexing).
Naturally, if the gradient is zero, then you don't do any update on the weights, so this is what we want.

## What happens when there are `-infs`?

Using the same example above, we now explore what happens when we set an entire row to `-inf`.
Specifically, this line was added `input_tensor[-1] = float('-inf')`.

```python
import torch
import torch.nn as nn

# Define the input tensor and target tensor
input_tensor = torch.ones(3, 5)
input_tensor[-1] = float('-inf') # Note this is added!
input_tensor.requires_grad = True
target_tensor = torch.tensor([1, 2, -1])  # Assuming ignore_index is -1

# Create the CrossEntropyLoss criterion with ignore_index
criterion = nn.CrossEntropyLoss(ignore_index=-1)

# Compute the loss
loss = criterion(input_tensor, target_tensor)

# Print the loss
print("Loss:", loss.item())

# Perform the backward pass
loss.backward()

# Print the gradients
print("Gradients:")
print(input_tensor.grad)
```

```console
Output:
Loss: 1.6094379425048828
Gradients:
tensor([[0.1000, -0.4000,  0.1000,  0.1000,  0.1000],
        [ 0.1000,  0.1000, -0.4000,  0.1000,  0.1000],
        [    nan,     nan,     nan,     nan,     nan]])
```

Observe now that the entire third row contains `nan` values, which is the cause of our entire problem.

## How can I debug this in reality?

I read the PyTorch forums and the best way to debug `nan` values in loss is perhaps to start by adding `torch.autograd.anomaly_mode.set_detect_anomaly(True)` at the top of your script.
After adding that, I immediately saw that the error was:

```console
RuntimeError: Function 'LogSoftmaxBackward0' returned nan values in its 0th output.
```

which suggested that I had an issue with my gradients.
That led me to my deep dive and a better understanding of how `ignore_index` is used and this blog post.
