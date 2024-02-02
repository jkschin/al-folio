---
layout: post
title: PhD Reflection (and hopefully advice to prospective students)
date: 2024-01-29 11:59:00-0400
description:
categories: personal
disqus_comments: false
related_posts: false
toc:
  sidebar: left
---

## Introduction

It's the final week of the Independent Activities Period (IAP) at MIT and I attended an event titled "IAP 2024: Expanding Horizons in Computing".
I consciously chose not to link this page as it's definitely going to become stale one day and I do not want to have to deal with that.
I have other reflections on the talks, but I want to highlight the importance of stepping back from research once in awhile to see what's out there.
In particular, I chose to attend the talks on Computer Security.
I learnt about Fully Homomorphic Encryption, amongst other things.
However, my biggest takeaway was searching for a speaker (Henry Corrigan-Gibbs) and coming across his [personal page](https://people.csail.mit.edu/henrycg/).
Under the advice section on CG's page, I saw three articles from
[Manuel Blum](https://www.cs.cmu.edu/~mblum/research/pdf/grad.html),
[Mor Harchol-Balter](https://www.cs.cmu.edu/~harchol/gradschooltalk.pdf) and
[Richard Hamming](https://www.cs.virginia.edu/~robins/YouAndYourResearch.html) and read them (technically the one from Hamming is a transcribed lecture).
I started by browsing the article from Manuel Blum and he mentioned that you should _always_ be writing.
I immediately took out a pen and paper and started to write some thoughts and then decided to write a proper reflection as I'm currently midway (approximately) through my PhD (I'm all done with classes and finished my Thesis Proposal meeting).
This reflection serves to synthesize my thoughts and hopefully inform prospective students on whether or not they should pursue a PhD.
In addition, I write some thoughts on how to approach research.
Nothing beats reading those three articles yourself though!

## Why do a PhD?

To answer that question, I'd have to start with a brief history of my life trajectory.
I graduated in 2015 with a degree in computer science.
Unsure of what to do next, I joined a government research lab and did applied research.
I was interested in the research problems and started reading many papers from Computer Vision (CV) conferences like CVPR, ICCV and ECCV.
This was also the start of the deep learning revolution and AlexNet was only published three years ago.
I still recall using Caffe and some other weird deep learning frameworks - those were really hard to use.
Seeing an opportunity to commercialize CV, I joined an accelerator to start a CV company.
That didn't work out and I joined Palantir in 2017.
Even at Palantir as a software engineer, I dug into the code, tried to fully understand the frameworks, the architecture decisions, etc.
I read many textbooks on the many flights that I was on.
I found myself attracted to hard problems and diving deep into something and fully understanding it.
Mor Harchol-Balter's comment resonates with me:

> **There’s also the joy of doing it right**. In a company, the aim is to
> get a working product and ship it out quickly. In research, you can take your time
> and plan out your project so that you are proud to defend every one of your design
> decisions. Research is not about simple heuristics or quick hacks. Many people
> also relish the joy of being the authority on an area and of having their work read
> and cited by others.
> -- <cite>Mor Harchol-Balter</cite>

Indeed, there is joy in itself of having the freedom to plan something, execute it, and doing it right within the set of resource constrants you're given.
I say this, as even within a PhD, you do not have infinite time.
You have more time to dive deeper into something when compared to a commercial environment, but time and money is still finite.
I guess while at Palantir, I wanted to do a PhD at the back of my mind and do more work in deep learning (commonly called AI nowadays but I'm still old school).
Well, I'm at MIT for a PhD now, and the rest is history.
I'm right about midway through my PhD and I have finished all my required classes.
I do enjoy taking classes, and would continue taking perhaps one class each semester.
However, it would probably not be optimal to do that, and Mor Harchol-Balter discusses it more in her document.
Coming from industry, I thought how she described a PhD was largely accurate:

> The Ph.D. is a tremendous opportunity. You get to pick an advisor in any research area you like and then you get to do research in that area, receive mentoring,
> **think deeply on problems**, publish papers, become famous, while paying zero tuition for 6 years and receiving a salary.
> -- <cite>Mor Harchol-Balter</cite>

So what's next after my PhD?
I haven't thought it out thoroughly, and this is bound to change.
I know I do want to build a product or commercialize my research and start a company.
I am also keen on research and AI is really an exciting field now.
In particular, the recent papers on [discovering new materials from DeepMind](https://deepmind.google/discover/blog/millions-of-new-materials-discovered-with-deep-learning/) is really cool.
Having a PhD gives me the option of doing research upon graduation.

> When making a decision about the next 6 years of your life, it’s good to stop and
> think about what you might do when you finish. Most students upon completing a
> Ph.D. either go into academia (research university or teaching school) and become
> a professor, or they go to a research lab. Some people never do research again after
> completing a Ph.D. For such people, the Ph.D. was largely a waste of time.
> -- <cite>Mor Harchol-Balter</cite>

If I don't do research after graduation, would it really largely be a waste of time?
It was a great intellectual exercise and I got to dive deeper into some of the topics that I am interested in.
Put another way, this was probably my only chance of doing it.
I don't think I would do it at an older age as I would have other priorities then.

## How should you approach research?

I read The Power of Habit by Charles Duhigg last year.
A key insight I got was that if you want to shape your mind to do X instead of Y (where X is the optimal thing to do) when a certain cue happens, you can write down exactly what you will do when you face that cue and it will be much easier to tune your mind to the good habit.
Why does this matter?
Well, a lot of times in your PhD, you will be tempted to just read for the sake of reading, with no clear goal in sight.
Or when you are stuck on a problem for 1 hour and you finally have the Eureka moment - you decide to take a break and come back to it 15 minutes later, only to spend another 30 minutes trying to figure out how you got to the Eureka moment.
The optimal thing to do there is simply to just sit for another 5 to 10 minutes, write down your thoughts, and then take a break.
If all this sounds familiar to you, then the next few sections will be extremely relevant.
The next few sections will be structured around cues and how to handle them - practical tips that you can directly execute.

**It's the start of a new semester. You're in this exciting new class. You look at all the readings and the textbooks, and you decide to read textbooks end to end.**

I love reading.
In particular, I love reading a textbook end-to-end.
With infinite time, it's possibly effective, as you can read it over and over again and you glean new insight each time you read.
However, I quickly found that sometimes it's important to just zoom into a concept, write some math and code, and understand that concept really well.
I was reminded of this and Manuel Blum put it really well:

> Books are not scrolls.
> Scrolls must be read like the Torah from one end to the other.
> Books are random access -- a great innovation over scrolls.
> Make use of this innovation! Do NOT feel obliged to read a book from beginning to end.
> Permit yourself to open a book and start reading from anywhere.
> In the case of mathematics or physics or anything especially hard, try to find something anything that you can understand.
> Read what you can.
> Write in the margins. (You know how useful that can be.)
> Next time you come back to that book, you'll be able to read more.
> You can gradually learn extraordinarily hard things this way.
> -- <cite>Manuel Blum</cite>

Clearly, the inference one can make about this is to read papers from one end to the other as it is a scroll.
How should one read a paper then?
For that, I refer the reader to [a video from Andrew Ng](https://www.youtube.com/watch?v=733m6qBH-jI).
It is also important to note here, some wise advice from Richard Hamming:

> There was a fellow at Bell Labs, a very, very, smart guy. He was always in the library; he read everything. If you wanted references, you went to him and he gave you all kinds of references. But in the middle of forming these theories, I formed a proposition: there would be no effect named after him in the long run. He is now retired from Bell Labs and is an Adjunct Professor. He was very valuable; I'm not questioning that. He wrote some very good Physical Review articles; but there's no effect named after him because he read too much. If you read all the time what other people have done you will think the way they thought. If you want to think new thoughts that are different, then do what a lot of creative people do - get the problem reasonably clear and then refuse to look at any answers until you've thought the problem through carefully how you would do it, how you could slightly change the problem to be the correct one. So yes, you need to keep up. You need to keep up more to find out what the problems are than to read to find the solutions. The reading is necessary to know what is going on and what is possible. But reading to get the solutions does not seem to be the way to do great research. So I'll give you two answers. **You read; but it is not the amount, it is the way you read that counts.**
> -- <cite>Richard Hamming</cite>

**You now know the techniques of reading. You buy the physical textbook or you download the PDF onto your laptop or you are reading a paper. You wake up early in the morning and go to a cafe. You first start scrolling social media, and then open up your textbook or laptop. You resist reading the introduction of the textbook and focus on key chapters, or you read the paper optimally. You read a few lines, and sip a coffee, and this repeats. Half an hour later, you have the ideas all in your head. Three days later, you vaguely recall the ideas but can't fully communicate what the concept is.**

This is a situation that happens to me often.
I know the ideas - it's in my head.
However, it's so hard to write it down in text.
I find myself referring back to the original paper when writing it down.
Over the years of my PhD, I found that taking out a writing pad to sketch out some ideas helps.
In fact, directly synthesizing your thoughts and writing a short literature review of it or a short blog post about it would help greatly when you're assembling the final paper.
This can significantly improve your efficiency.
Do you have to write this for every single paper you browse or read?
Probably not.
If there's a good chance you're going to cite it or use the concepts in your work, then it could be worth writing a short document on it.
Again, the wisdom of Manuel Blum shines here:

> Consider writing what you read as you read it.
> This is especially true if you're intent on reading something hard.
> -- <cite>Manuel Blum</cite>

and here:

> You are all computer scientists.
> You know what FINITE AUTOMATA can do.
> You know what TURING MACHINES can do.
> For example, Finite Automata can add but not multiply.
> Turing Machines can compute any computable function.
> Turing machines are incredibly more powerful than Finite Automata.
> Yet the only difference between a FA and a TM is that
> the TM, unlike the FA, has paper and pencil.
> Think about it.
> It tells you something about the power of writing.
> Without writing, you are reduced to a finite automaton.
> With writing you have the extraordinary power of a Turing machine.
> -- <cite>Manuel Blum</cite>

**We now have a framework of reading and writing down our ideas. You've also probably heard (I don't know who first said this) of how choosing the right problem gets you 50% (or some X%) of the way there. What kind of problems should you work on?**

Regardless of whether or not you intend to go into academia or industry, you want to do impressive work.
After all, what you write and publish will be on the internet _forever_.
You would want it to be something you're proud of - right?
Of course, you can choose the hardest problems in the world to solve, like teleportation or time travel (see below), but you're never going to get a PhD from that (at least as of writing, I don't see how this is remotely possible).
Richard Hamming succinctly puts it:

> If you do not work on an important problem, it's unlikely you'll do important work. It's perfectly obvious. Great scientists have thought through, in a careful way, a number of important problems in their field, and they keep an eye on wondering how to attack them. Let me warn you, `important problem' must be phrased carefully. The three outstanding problems in physics, in a certain sense, were never worked on while I was at Bell Labs. By important I mean guaranteed a Nobel Prize and any sum of money you want to mention. We didn't work on (1) time travel, (2) teleportation, and (3) antigravity. They are not important problems because we do not have an attack. It's not the consequence that makes a problem important, it is that you have a reasonable attack. That is what makes a problem important.
> -- <cite>Richard Hamming</cite>

**You now have decided on a problem, and also a reasonable attack. But what does a reasonable attack mean? What if you get stuck?**

After reading tons of papers, you get a sense of the field and see some gaps that you can plug.
You have it in your head, or perhaps written down, a strategy to attack the problem.
Inevitably, you will face bumps along the way and get stuck on a step in your strategy.
This could be anything from making a wrong assumption about something, acquiring new information and realizing you were wrong, and so on.
Whenever I get stuck, I find myself going outside for a walk and thinking in my head.
I get myself unstuck and I end up not writing down the steps to get unstuck at times, and I have to repeat this process.
This goes back to the earlier point of Manuel Blum earlier and writing - always be writing.
In fact, I would say that _writing_ and _typing_ is fundamentally different.
I can type faster than I write (most do), and I can easily do a brain dump of whatever is in my head.
However, the benefit of writing is that you _cannot_ write as fast - your brain is forced to be efficient and synthesizes the most important things, which in itself could be valuable.
The importance of writing might be the **side benefit of synthesis**.
I found that when I do a typing brain dump, I have to revisit it and synthesize it.
More importantly, the reason why I am typing all this, is that I am doing some form of meta thinking about my processes of typing and writing - I am thinking about how I think.
When you are stuck, think about how you're thinking.
Why are you thinking this way?
Do other people think this way?
Is there someone else that thinks differently and you can learn from her?
As Manuel Blum puts it:

> There will come a time when you work on a problem long and hard but UNsuccessfully :(
> And then you learn that someone else found a solution.
> See this as the GREAT opportunity it is to learn something important.
> Don't let it pass you by.
> Ask yourself: "How SHOULD I have been thinking to solve that problem?"
> I have found that doing so is a powerful exercise.
> Danny Sleator tells me that BOB FLOYD independently recommended exactly this exercise to his students.
> He would lead them into asking themselves:
> "How COULD I have led myself to that answer?"
> Take the time to think it through.
> It's worth it.
> -- <cite>Manuel Blum</cite>

PhD students are obsessed with thinking about the problem and finding solutions.
However, very few spend time thinking about how they are thinking, and this is quite important.

## Conclusion

I have more to discuss, but I think it is a good time to take a pause here.
We discussed why you should do a PhD and if you have decided on doing one, how you should approach research in terms of reading, finding an important problem and also getting yourself unstuck.
Nothing beats reading the articles themselves, and I probably will re-read them at some point.
My PhD involves writing quite a bit of code, and I do want to write an actual tactical plan on how to execute a research paper, but I will leave this for another post day and keep this focused.
