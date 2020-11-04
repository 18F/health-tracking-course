---
layout: widepage
title: "Progress and Risks"
course: 1
lesson: 3
indicator: procurement
priority: high
visible: true
date: October 8, 2020
releaseQuestions:
    -   What are the three things he thinks developers are trying to balance?
    - Which two qualities does he and his team focus on?
    - When something is broken or not ready, what do they do with it?
    - How much time do developers have to work on new features?
    - How many changes happen on <code>facebook.com</code> every week?
    - How long do engineers have to make sure their features are ready for release?
    - Is there ever any question about when new versions will be released?
    - Chuck talks about *beta* and *alpha* versions; how often do they release these versions to people?
---


# {{page.title}}

*This lesson explores the highest priority dimension of the Procurement Flexibility indicator of the health tracking rubric.*

{% include rubric dimension="pf1.1" %}

* TOC
{:toc}

## Progress and Risks

Tracking progress and understanding risks in software projects isn't as easy as you'd think. Or, perhaps, as easy as you'd like.

To understand progress and risks in the context of a large, long-running software project, we're going to wrestle around in the space of a few broad questions:

* How are deadlines chosen? Who chooses them and why? 
* What stories are told when deadlines are hit, and what stories are told when deadlines are missed?

To put these questions into context, we're going to learn a bit about **feature-based software releases** and **time-based software releases**.

## Feature-Based Releases (5m, solo)

There are two broad ways we tend to think about software releases: feature-based, and time-based.

A feature-based release cycle means that the team identifies a list of features. Imagine an app that lets users find, vote on, and buy chickens that they would like to raise in their back yards. (Yes, I know, it is silly.) Some requirements might look like the following:

1. Software should allow users to load pictures of chickens.
2. Software should allow users to pick their favorite chickens.
3. Software should connect users to a store where they can buy chickens.

Given this feature list, the team might then decide an order for developing these features. (For simplicity, let's assume they work in order: 1, 2, 3.) They begin work.

When feature #1 is done, the software is sent out to users. If it is a website, that means that users will see the changes the next time they log in.

When feature #2 is done, the software is sent out again. And, the same for feature #3.

Note, however, that there's no discussion here of how *long* it takes for these features to be developed. It may be that a feature is really complex, and therefore requires a long time to develop.

### Feature-Based Releflection (10m, solo)

Think about the projects you oversee. What do you know about how they are developed and released? Does the vendor seem to use a feature-based process?

How can you tell? Or, what makes you think this is so (if it is)? If it isn't, why do you think they use some other release process?

## Time-Based Releases (5m, solo)

Time-based releases are different. Continuing with our imaginary raising-chickens app... 

Instead of saying "we'll release our software when people can upload pictures of chickens," we instead say "we will update the website with all of the completed functionality and features every month, no matter what." This kind of release cycle guarantees that new features are always going out. If a feature is too big to finish in a month, then it gets bumped to the next month. But, the time-based release cycle guarantees that bug fixes, updates, and new features are rolling on a fixed, predictable schedule.

### Time-Based Reflection (10m, solo)

Many software vendors don't follow one release process; in fact, they might not have one that is clear at all. 

Again, think about projects that you oversee. Do the projects tend to be feature- or time-based in their release scheduling? Is there anything about the structure of funded government projects that suggest one release model vs. another? Why?


## What's a Software Release? (1h, solo)

Software projects are never *done*. But there is a point where the people *writing* the software decide to let other people *use* the software. The act of sharing the software with others might be called a *software release*, or more commonly, just a *release*. 

It's a bit of a deep dive, but take a listen to 13 minutes of this video. This is Chuck Rossi who (at the time -- this is from 2014) headed up Release Engineering at Facebook. He is talking about what it means to *release*, or *make available to users* the web-based version of Facebook (meaning <code>facebook.com</code>) and the app version written for mobile phones.

When you're watching, note that he's talking about *software products used by hundreds-of-thousands to millions of users*.

This is a professional engineer at the top of his craft talking about his work in very specific ways; it will therefore be hard to follow in places. But, watch and listen to try and answer these questions. You should only watch from minute 16 to minute 29; if you want to watch more, feel free, but all of these questions are answered in 13 minutes.

<ol>
{% for q in page.releaseQuestions %}
    <li> {{ q }}</li>
{% endfor %}
</ol>

<iframe width="560" height="315" src="https://www.youtube.com/embed/Nffzkkdq7GM?start=989" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

{% alert warning Building Confidence %}

<p>
    It is possible that this video bothered you in some way.
</p>

<p>
    Perhaps you felt it lacked context.
</p>

<p>
    Perhaps you felt it was too advanced.
</p>

<p>
    Perhaps it felt like every other conversation about software projects, where you just didn't have enough background to make heads-or-tails of things, and therefore, you were just kind of like... <b>shrug</b>?
</p>

<p>
    Consider doing this: after you've done your best to answer the questions, watch it again. If you need to, occasionally run things back a few seconds, and rewatch things when you <i>think</i> things are making sense, but you're not quite sure.
</p>

<p>
    The reason to revisit the video is to build some confidence. You know a lot about this stuff, and when you give yourself time and space (which is rare, I know...) to pause and reflect, you know more than you think. It's sometimes hard to track in the moment, but that's OK. Keep that in mind that while you're in meetings and working with teams you can always give yourself time and space to think about things after a meeting or conversation, talk to colleagues, and circle back around to better understand what is going on with your states and vendors.
</p>

{% endalert %}

## In Conversation: Release Cycles (1h)

This dimension of the rubric asks you to think about the way projects are being developed and released. Understanding the release model (or the *lack* of a release model) will help you understand some fundamentals of how the vendors are working on and releasing product to the states. And, how the states interact with and manage that cycle will, ultimately, impact how services are delivered to end-users.

Start your conversation with a re-watch of the video, as a group. Your goal, as a group, is to pause whenever you have an answer to one of the prompt questions. (They are restated below for your reference.)

<ol>
{% for q in page.releaseQuestions %}
    <li> {{ q }}</li>
{% endfor %}
</ol>

When you pause, do two things:

1. Take a moment to discuss why you think the question is being answered at this point in the video.
2. Use the pause to surface times you have seen this in your own projects or when you saw the opposite of the behavior being exhibited. (Each question suggests a behavior and, therefore, an anti-behavior.)

If you need to/want to, pick 2-3 questions to focus on. Don't be afraid to focus in on one or two spaces, and dig deep. 


## Final Reflection (20m, solo)

When you're done, write up one of the questions in your journal -- what did you learn? What challenged you? What new things are you going to look for in your projects? And, which of these questions do you think you will be coming back to as you look at and evaluate projects along this dimension?
