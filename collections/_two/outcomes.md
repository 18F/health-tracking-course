---
layout: widepage
title: Measuring and Metrics
lesson: 1
indicator: outcomes
priority: high
visible: true
date: October 27, 2020
course: 2
metrics:
    - Cycle Time|time spent on each issue?
    - Release Cycle Time|time between releases?
    - Velocity|how many features delivered in a time period?
    - Throughput|how many tasks, chores, bugfixes, and features shipped in time period?
    - Number of Open Pull Requests
    - Work in Progress|how many tasks open and underway per time period?
    - Feature Difficulty|how hard to implement were the features built out?
    - Impatience Score|do devs think things can go faster?
experts:
    - Allison Grappone
    - Ross Smith
    - Skot Carruth
    - Jonathan Roger
    - Vlad Giverts
    - Michael Mah
    - Swapnil Bhagwat
    - Rodolfo Justoni
    - Doru Paraschiv
    - Cristian Rennella
    - Tosho Trajanov
    - Andrew Ward
    - Dawn Roberts
    - Gady Pitaru
    - Steve Krzysiak
    - Rob Zuber
    - David Attard
    - Kean Graham
    - Dan Rasband
    - Hristo Stalev
    - Andrew Haller
    - Steve Mezak
---

# {{ page.title }}

*This lesson is about measuring progress and the metrics used. Understanding progress measurement is a high priority in the outcomes-orientation primary indicator.*

{% include rubric dimension="oo1.2" %}

At *some* level, measuring progress on a large, long-running software project is an impossible task. 

Given that, it means that is is a *huge* space for vendors and states to *claim* that progress is being made *even if progress is not being made*.

This lesson looks at some frameworks for assessing the health of a program, and encourages you to develop a "questioning state of mind" when it comes to evaluating how states and vendors measure progress and success. 

* TOC
{:toc}

## Ordering: What Do You Think? (15m, solo)

Jama Software has {% link nbmtmstp text="nine metrics that they think relate to software team speed and productivity" %}. We offer these as food for thought, and are not suggesting that they are "the best" or "the only" ways to think about software team productivity.

Give the article a skim. Make sure to note questions you have about these metrics as you read; we have to admit, it's not a very... *verbose*... article. Then, come back, and re-order the metrics (by dragging-and-dropping) so that the metric that you think would tell you the **most** about a team's product quality is at the **top**, and the metric that you think would tell you the **least** is at the **bottom**.

<div class="drag-container">
{% for elem in page.metrics %}
    {% assign arr = elem | split: "|" %}
    {% assign tag = arr[0] %}
    {% assign desc = arr[1] %}
    <div id="item{{forloop.index}}" class="drag-box"><b>{{tag}}</b><br><small>{{desc}}</small></div>
{% endfor %}
</div>

Note your top two and bottom two in your notebook for later discussion, as well as *why* you thought these were the top two and bottom two.

## Reading: What The Experts Say (30m, solo)

Stackify's blog has {% link dlrbmfmsdp text="an interesting set of interviews" %} with experts in software development and the management of software projects. 

Below are two random experts from the article. (<a href="#/" onclick="getTwoExperts()">Click to generate two new names!</a>) Jot these down.

<ul id="twoexperts">
</ul>

Now, read what those two experts have to say in the Stackify article. After you've read and noted the highlights of what they have to say, compare and contrast. If you were approaching the evaluation of your state's projects, which of these experts do you think are offering you better advice? Why? Which do you think would not be useful to you? Again, why?

Record your thoughts in your notebook. We're going to come back together to report out on what you gathered from these experts, and also share out what you thought would actually be useful to you in your context. 

{% alert no-icon Always Questioning %}

<p>
    As always, you should also be noting anything that you have questions about. There are no "dumb" questions, there are no questions that you should "already know the answer to." Sometimes we can see things in a new way, and it makes us wonder. Make sure you keep track of those questions so you can bring them to the group to discuss, and for everyone to learn from.
</p>

{% endalert %}

## Viewing: Counterpoint on Measurement (30m, friend)



<script>
    function randomTwo(arr) {
        arr = arr.split(",");
        var first = arr[Math.floor(Math.random() * arr.length)];
        var filtered = arr.filter((v, i, arr) => { return v != first; });
        var second = filtered[Math.floor(Math.random() * filtered.length)];
        return [first, second];
    }

    function getTwoExperts() {
        var two = randomTwo("{{ page.experts | join: "," }}")
        document.getElementById("twoexperts").innerHTML = "<li>"
            + two[0] + "</li><li>" + two[1] + "</li>";

    }

    getTwoExperts();
</script>


{% include airtable-post.html %}