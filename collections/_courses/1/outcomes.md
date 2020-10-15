---
layout: widepage
title: "Reading the Map"
course: 1
lesson: 1
indicator: "Outcomes & Orientation"
priority: High
visibility: Visible
date: October 15, 2020
---

# {{ page.title }}

*This lesson explores the highest priority dimension of the Outcomes and Orientation indicator of the health tracking rubric.*

{% include rubric dimension="oo1.1" %}

Roadmaps are a tricky thing. They are a space where development teams can lie to leadership, vendor leadership can lie to states, states can lie to SOs, and everything can look like it is perfectly on track.

Roadmaps can also be a source of *radical transparency*, where something approaching the ground truth of the project can be ascertained. However, that assumes that the vendor and state are in agreement around what a roadmap can and should be.

There are many kinds of roadmaps, many ways they might be implemented, and therefore, as an SO, you need to have both 1) a **conceptual** understanding of what a roadmap is as well as 2) a **practical/applied** understanding, so you can either praise the work you see, or demand improvements that give you better visibility into the health of a project. 

As you engage in your reading and viewing, **remember to make note of questions that you have about the material**.

* TOC
{:toc}

## Conceptual: What Kind, When? (1h, solo)

There are *many* kinds of roadmap. When it comes to categorizing things, I sometimes find it is good to start with a spectrum, or grid. That is, I like to find a way to "position" what I'm looking at.

<div class="grid-row grid-gap">  
    <div class="grid-col-3 grid-offset-2" style="display: block; height: 100px;">
        Mature Project
    </div>
    <div class="grid-col-3" style="background: #ccc; display: flex; justify-content: center; align-items: center">
        Theme-Based Roadmap
    </div>
    <div class="grid-col-3" style="background: #aaa; display: flex; justify-content: center; align-items: center">
        Feature-Based Roadmap
    </div>
</div>
<div class="grid-row grid-gap">  
    <div class="grid-col-3 grid-offset-2" style="display: block; height: 100px; ">
        Young Project
    </div>
    <div class="grid-col-3" style="background: #eee; display: flex; justify-content: center; align-items: center">
        High Level/Theme-Based Roadmap
    </div>
    <div class="grid-col-3" style="background: #ccc; display: flex; justify-content: center; align-items: center">
        Theme-Based Roadmap
    </div>
</div>
<div class="grid-row grid-gap">  
    <div class="grid-col-3 grid-offset-2">
    </div>
    <div class="grid-col-3" style="display: flex; justify-content: center; align-items: center">
        Dynamic Market
    </div>
    <div class="grid-col-3" style="display: flex; justify-content: center; align-items: center">
        Stable Market
    </div>
</div>

When working with software in a government context, we are not really dealing with a *market*. That is, we're talking about things like *case management systems*, which are not (sadly?) rapidly evolving tools. We'll therefore assume that a government "marketplace" is *stable*.

This suggests that we might be looking at a *theme-based roadmap* or a *feature-based roadmap*.

### Theme-Based Mapping

The first half of Janna Bastow's slide deck on Agile Product Roadmaps ({% link capreu %}) is a really good read. 

You can either read through the deck, or if you like, you can watch Janna present it.

<div style="padding:56.25% 0 0 0;position:relative;"><iframe src="https://player.vimeo.com/video/100642934" style="position:absolute;top:0;left:0;width:100%;height:100%;" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>


As Janna says, a good theme-based roadmap is going to communicate **time horizions** (current/near term/future), **objectives**, **scope**, and the **product areas** that any given work effort will cover. Where I think her deck tells a little lie is in the second half; that is, it suggests or implies that you can start with vision, get to goals, and somehow (from there) work your way down. 

Done right, the team **starts with user stories**, and works their way up to the product vision. David Hawks has a nice article ({% link hawks %}) that captures how a team should generally go about building up a story map.

To sum up, a story map will generally suggest this kind of thinking:

<div style="display: flex; justify-content: center; align-items: center">
    Vision ➡ Goals ➡ Activities ➡ User Stories
</div>

But, a story map should be *built* the other way:

<div style="display: flex; justify-content: center; align-items: center">
    Vision ⬅ Goals ⬅ Activities ⬅ User Stories
</div>

I highlight this because we're going to be talking about **how the states and vendors work with real users** later, and if they haven't been, it may already start to show up in the theme map. And, because this is all important context to understanding a roadmap when you're handed one.

### Feature-Based Mapping

A more mature product is going to be more focused on features and feature delivery. This makes sense once a team is well-gelled, communicating openly with the partner, and continuously delivering features and product on a bi-weekly basis. (This is the essence of agile software development.) 

A feature-based map may look a bit more like either a goal-oriented product map (a GO map) or a now/next/later map. Robbin Schuurman has a nice overview of both of these kinds of maps ({% link schuurman %}) that describes these; again, give this a read, and then come back.

### All The Details

Storymapping and product management is a whole set of subjects unto themselves. If you want to read more, you might browse content on Atlassian's *Agile Coach* website; Bree Davies has a nice article on roadmaps ({% link davies %}) that provides some additional context and background. We don't want to bury you in material, so we'll offer the reference, and if you have time, give it a go. If not, go ahead and move on... all of this learning will require you to revisit sources from time-to-time as you encounter new situations and challenges, so fear not... there is more to be learned than can ever be learned...

## Understanding a Map (30m, solo)

You've seen roadmaps as parts of projects before.

Pull one. Go back to a recent roadmap from one of your projects, and look at it. Then, answer these questions for yourself in your notebook. These questions are less reflective and more descriptive in nature; they mostly question the *what* and *how* of the map.

1. What is the vision for the product or software?
2. What value does it offer?
3. How will it improve things for the end-user? The partner state/agency?
4. Why is the vendor well positioned to deliver this value? 
5. Who is the user of the product?
6. What do those users care about?
7. What metrics are being used to define success?
8. Can those metrics be used over time to track progress?
9. Is the value of this solution greater than the cost of switching vendors?
10. What makes the product unique and continued investment defensible?
11. Does the implementation team have the capacity to do the work?
12. How much time and resource will each part of the map take to implement?
13. What time pressures exist?
14. Does the roadmap maximize the use of resources along the way?

These are fairly common roadmap questions. 

## Reflecting on a Map (30m, solo)

These questions are of a different nature. The previous set of questions asked you to make some judgements... but, really, they're questions that a good roadmap should almost answer for you.

Your job as a State Officer, M.D. is to probe deeper. If you have a healthy relationship with your state and their vendors, these questions will be easy. However, it might be that the vendor is concerned about holding on to their contract, but less worried about delivering excellence and value to the state. In that case, you're going to need to ask bigger, harder questions about the roadmap. 

1. Was the roadmap written with a general audience in mind, or does it use technical terms and make things complex where they might otherwise be simple?
2. Is it up-to-date, or is the same roadmap used over-and-over, from one cycle to the next?
3. Does the roadmap over-promise? Does it magically suggest that a perfect, finished product will be delivered some time in the future? Or, does it have reasonable timelines with achievable goals?
4. Does the roadmap include places where users will have input, and that input might shift the direction of the product as a result?
5. Is there any indication that all of the critical stakeholders (developers, product team, the partner state or agency, and end-users) were consulted as the roadmap was brought together?

## Discuss in Community (1h, group)

These questions are all meant to help you get at this one dimension of the rubric:

{% include rubric dimension="oo1.1" %}

Come together with your colleagues for a conversation.

1. **Check in**. (5m) First, check in with each-other. How is everyone doing? Take a moment to share something positive from the week, either at work or at home.
2. **Understand**. (20m) Next, take some time to  discuss points where you were confused or questioned your material. That is, did you find yourself questioning or wanting to challenge the authors at any point? Did you want to call "bullshit" on what they were saying based on your own personal experience? This would be a great place to probe ideas; help each-other unpack why you feel this way about the readings.
3. **Reflecting**. (20m) You each had your own roadmaps you investigated and questioned; take a few minutes each to share the roadmaps you scrutinized. Focus on two things: areas where you thought the roadmap was excellent or clear, and areas where you were concerned. For each roadmap, as a group, offer suggestions for how you would like to see the state and/or vendor improve the roadmap in the next iteration. This could be in the form of questions that you want to ask, or it can be recommendations.
4. **Questioning**. (10m) For the last few minutes, take some time to expand the questions that we asked about roadmaps. You have your own experiences as SOs, and those experiences should inform your inquiry. What questions (in addition to the ones asked as part of your solo work) do you think you should be asking of each new roadmap that you see? Make sure to share those questions back, so they might be incorporated into future versions of these learning materials!

## Reflect Out (10m, solo)

When you're done, we'd greatly appreciate you taking a few minutes to briefly reflect out from this lesson.