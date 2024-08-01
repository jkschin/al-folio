---
layout: post
title: Deciphering src_key_padding_mask
date: 2024-08-01 11:59:00-0400
description: A deep dive into src_key_padding_mask and how to check for correctness.
tags: code
categories:
disqus_comments: false
related_posts: false
toc:
  sidebar: left
---

## Introduction

How do you know your ML model is learning correctly?
After all, given enough capacity, it could probably fit any input you give it.
You can have a low loss and decently correct outputs, but is your model actually correct?
I was checking my code recently and decided to dive deep into how `src_key_padding_mask` in PyTorch Transformers work and check if my outputs are actually correct.

## Padding in Transformers

In most Transformer models, padding is necessary as your inputs may have a different size.
For example, a given sentence could be 100 tokens long, but another sentence is 101 tokens long.
For efficient batch training, it is necessary to pad these inputs.
Of course, one can argue that the additional padding would cause inefficiency, but that's really a separate point for another day and in general you would still pad.

In the code example below, we specifically test the `TransformerEncoder`.
It is also relatively easy to think of a test that would convince us that it is doing the right thing.
Consider an input of shape `(32, 10, 512)`, which represent the batch size, sequence length and dimension respectively.
Further consider how perhaps only the first two tokens are relevant, and the other 8 are simply padded tokens.
You would expect that this input, together with a correctly constructed `src_key_padding_mask` would yield a relevant output (`output[:, :2, :]`), with the other outputs being irrelevant (`output[:, 2:, :]`).
Finally, if you put into this same Transformer `input[:, :2, :]`, the output should be identical to `output[:, :2, :]` **with the** `src_key_padding_mask`.
Put simply, self-attention on the two relevant tokens is equivalent to self-attention on all ten tokens with the correct `src_key_padding_mask`.
With this intuition, I worked with Google Gemini to generate some starter code to test this, and it's correct!

## Code

```python
import torch
import torch.nn as nn

# Test the model

if __name__ == "__main__": # Create input data (bsz x seq_len x dim)
    bsz, seq_len, dim = 32, 10, 512
    input_data = torch.randn(bsz, seq_len, dim)

    # Initialize model
    encoder_layer = nn.TransformerEncoderLayer(
        d_model=512,
        nhead=8,
        batch_first=True,  # (bsz, seq_len, dim) format
        dropout=0.0,  # ensures more determinism
    )
    transformer_encoder = nn.TransformerEncoder(encoder_layer, num_layers=3)

    for pad_idx in range(3, 9):
        # Create the src_key_padding_mask
        src_key_padding_mask = torch.zeros(bsz, 10, dtype=torch.bool)
        src_key_padding_mask[:, pad_idx:] = (
            True  # True indices are the masked positions
        )

        # Forward pass
        output = input_data
        trunc = input_data[:, :pad_idx, :]
        for layer_idx, mod in enumerate(transformer_encoder.layers):
            output = mod(
                output, src_key_padding_mask=src_key_padding_mask
            )  # input data with src_key_padding_mask
            trunc = mod(trunc)  # truncated relevant input data

        # Observe how the truncated output is identical to the normal output with src_key_padding_mask
        # indicating that the padding is correctly handled
        assert torch.all(torch.isclose(trunc, output[:, :pad_idx, :], atol=1e-06))

    print("All test cases passed!")
```
