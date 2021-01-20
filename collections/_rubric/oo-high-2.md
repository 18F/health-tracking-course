---
layout: lesson
title: Measuring and metrics
dimension: oo1.2
overview: |
    Understanding outcomes involves measuring progress, which can be notoriously difficult with software development. Here, we explore what it means to assess progress, and whether a team can demonstrate progress against a set of reasonable metrics and baselines.
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

At *some* level, measuring progress on a large, long-running software project is an impossible task. 

Given that, it means that is is a *huge* space for vendors and states to *claim* that progress is being made *even if progress is not being made*.

This lesson looks at some frameworks for assessing the health of a program, and encourages you to develop a "questioning state of mind" when it comes to evaluating how states and vendors measure progress and success. 

## Ordering: What Do You Think? (15m, solo)

Jama Software has {% include link id="nbmtmstp" text="nine metrics that they think relate to software team speed and productivity" %}. We offer these as food for thought, and are not suggesting that they are "the best" or "the only" ways to think about software team productivity.

Give the article a skim. Make sure to note questions you have about these metrics as you read; we have to admit, it's not a very... *verbose*... article. Then, come back, and re-order the metrics (by dragging-and-dropping) so that the metric that you think would tell you the **most** about a team's product quality is at the **top**, and the metric that you think would tell you the **least** is at the **bottom**.

{% asset dragonfly.js %}
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

Stackify's blog has {% include link id="dlrbmfmsdp" text="an interesting set of interviews" %} with experts in software development and the management of software projects. 

Below are two random experts from the article. (<a href="#/" onclick="getTwoExperts()">Click to generate two new names!</a>) Jot these down.

<ul id="twoexperts">
</ul>

<script>
    function randomTwo(arr) {
        arr = arr.split(",");
        var first = arr[Math.floor(Math.random() * arr.length)];
        var filtered = arr.filter((v, i, arr) => { return v != first; });
        var second = filtered[Math.floor(Math.random() * filtered.length)];
        return [first, second];
    }

    function getTwoExperts() {
        var two = randomTwo("{{ page.experts | join: "," }}");
        var ul = document.getElementById("twoexperts");
        
        // Remove the old LIs.
        while (ul.firstChild) {
            // Because this is live/the way the DOM gets updated,
            // this *actually* works. It just feels... wrong.
            ul.removeChild(ul.firstChild);
        }

        // Add in the two new experts.
        for (txt of two) {
            var li = document.createElement("li");
            li.appendChild(document.createTextNode(txt));
            ul.appendChild(li);
        }
    }

    getTwoExperts();
</script>

Read what those two experts have to say in the Stackify article. After you've read and noted the highlights of what they have to say, compare and contrast. If you were approaching the evaluation of your state's projects, which of these experts do you think are offering you better advice? Why? Which do you think would not be useful to you? Again, why?

Record your thoughts in your notebook. We're going to come back together to report out on what you gathered from these experts and also share out what you thought would actually be useful to you in your context. 

{% capture body%}
<p>
    As always, you should also be noting anything that you have questions about. There are no "dumb" questions. There are no questions that you should "already know the answer to." Sometimes we can see things in a new way and it makes us wonder. Make sure you keep track of those questions so you can bring them to the group to discuss and learn.
</p>
{% endcapture %}
{% include alert level="no-icon" heading="Always Questioning" body=body %}

## Viewing: Counterpoint on Measurement (45m, friend)


{% capture body %}
<p>
    If you are engaging in this material with a learning cohort, it is reasonable to use your small group time to engage in this activity. 
</p>
{% endcapture %}
{% include alert level="no-icon" heading="Small Group Notice" body=body %}


You began by taking a very terse list of success metrics, and ordering them by importance. Then you read the statements of two experts and compared and contrasted what they had to say about software quality and measuring the progress of software teams. Now we're going to critique one developer's (PM's?) view on measuring software quality.

Or: *there's nothing like a little bit of devil's advocacy to spice things up*.

First, schedule 30m that you can get together with a colleague. In preparation for that meeting, watch this video once. This way, you're familiar with the content before diving into discussion.

<iframe width="560" height="315" src="https://www.youtube.com/embed/0yxfb-drlE4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Now, when you get together with your colleague, have a **viewing party**. This is where you watch a video together and comment in realtime. Normally, people install some software on their computers so that one person can control the start-and-stop of the video on both machines... but, we can't do that (because gov't computers). You could click the gear (the settings icon in the YouTube player) and reduce the quality of the video (to reduce bandwidth requirements), and have one person screenshare while another controls playback (it might work). Or you can just play it on your separate machines and shout "stop!" and "start!" at each-other. **Whatever works.** 

This video was chosen because:

1. It is short (8m long).
2. It is debateable.
3. Claims made are likely representative of vendor claims.

This is an exercise in calling bullshit. Imagine this is a vendor describing their software quality measurement process. You and your colleague were unable to make the presentation, so it was recorded for you to watch later. Therefore, you have the opportunity to comment and critique without having to respond in real-time to the vendor.

It is easy to have "pretender syndrome," where you wonder if you don't know enough about software projects to comment meaningfully. One way to overcome that is to develop foundational skills and knowledge (we're doing that in this course). However, talking about doing things is not the same as *doing things*. This roleplay activity is just that: instead of talking about riding a bike, we're actually getting up on a bike and practicing. 

Have fun, call bullshit, and if you need to, take some time to ask "why?" There's learning in exploring why a colleague thinks something has a smell. And, there's learning in your own explanations.

## Reflection (10m, solo)

When you're done, spend 10 minutes making notes in your journal. Specifically, make note of two or three things from your "calling bullshit" session where you note what you were particularly concerned about during the presentation, and why. 

{% include shared-experience-prompt.html %}

## Discuss in Community (1h, group)

These questions are all meant to help you get at this one dimension of the rubric:

{% include rubric dimension=page.dimension %}

Come together with your colleagues for a conversation.

You can click on the timers below to help keep yourselves on track.

1.  **Check in**. {% include countdowntimer minutes=5 %} First, check in with each-other. How is everyone doing? Take a moment to share something positive from the week, either at work or at home.
2.  **RapidShare&trade; Prep** {% include countdowntimer minutes=1 %} Take one minute to prepare what you want to say about your small group conversation. Specifically, note two things: **a single word**, and **a single sentence**. 
3.  **RapidShare&trade; Word**. {% include countdowntimer minutes=2 %} Next, take three minutes to slowly go around the group, and share out the one word that captured your reflections and thoughts from your small group activity. What one word captured your learning/insights?
4.  **RapidShare&trade; Sentence**: {% include countdowntimer minutes=8 %} Now, go around the group again. Use the template "My one-word summary was ____, and my one sentence summary would be ____," inserting your one word and one sentence in the template.
5.  **Reflecting**. {% include countdowntimer minutes=2 %} Now, pause. For two minutes, make notes on your own. Specifically, brainstorm one, possibly two questions you might want to ask the group about the learning of this lesson in light of what everyone shared. Perhaps you want to probe deeper into one person's comments, or perhaps you have a larger/"big picture" question for the group against the overall backdrop. 
6.  **Discuss**. {% include countdowntimer minutes=30 %} Let the conversation go where it does. Explore each-other's questions. Make sure everyone has a chance to join in the conversation, through questions and comments. If you have to, use {% include link id="dpoktra" text="cards or popsicle sticks" %} with everyone's name on them to make sure everyone takes part.
7.  **Wrap Up**. {% include countdowntimer minutes=5 %}  

