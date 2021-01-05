---
layout: lesson
title: Consider the User
dimension: id1.2
overview: |
    Testing is a sometimes misunderstood and, yet, critical aspect of a long-lived software project. This is especially true if you are trying to produce high-quality software in an iterative manner. This lesson will speak to the role that actual users play in the ongoing testing of a major software project.
---


If something is hard or frustrating to use, it just won’t get used the way we intend or at all. Without careful thought and planning, it’s easy for a development team to get caught up in hitting goals or milestones of the software without considering the needs of the people who use it.

If we create a piece of software or new feature and only stop to get feedback when all the work of making it is done, the entire effort might be wasted if it’s not useful to the intended audience. That’s why it’s important to check in with users at the beginning, middle, and end of the development process so that their feedback can steer the work toward a great product for them. Ideally, the user input should be as continuous as possible, and so this row in the Rubric  is a top priority in the iterative development process.

## Consider the end user (5m, solo)

**Timer**: {% include countdowntimer minutes=5 %} 

First, let’s consider the end user -- the person who uses the product or software that we’re building. Who are they? What type of person are they? What are their needs and how does what you’re building solve them? To capture these questions, user experience (UX) designers create “personas” that sort of act like characters in the story of making the software. This centers the user at the start of the development process and helps keep who you’re building for in focus throughout the process.

You may have heard terms like user-centered design, human-centered design, or UX. These all refer to part of this process of centering the end user and their experience with the software.

<iframe width="560" height="315" src="https://www.youtube.com/embed/UahMFILt304" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 

{% include link id="hcdin60" text="This short video" attr="duration" %} helps illustrate this process and shows that its a cycle&mdash;it doesn’t just mean asking users for feedback once and being done with it. Designing for humans means continually checking in as features come to life, testing with real people, gathering their feedback, and making changes to do it all again to get the most useful product for them at the end.

## Reflect (30m, solo)

**Timer**: {% include countdowntimer minutes=30 %} 

Let's take a short moment to write down some notes about the topics in the video. Empathy isn't something you usually hear about in software development, but it's an important tool in building something that works for users.

{% capture body %}
<p>
    The 4 main phases of human-centered design that are outlined in the video:
    <ul>
        <li>
            Inspiration
        </li>
        <li>
            Ideation
        </li>
        <li>
            Iteration
        </li>
        <li>
            Implementation
        </li>
    </ul>
</p>
{% endcapture %}
{% include alert level="no-icon" heading="Always Questioning" body=body %}


### Questions

1. The video explores four phases of HCD (above). Where have you seen this cycle in our own state's projects?
2. The video shows a text-to-speech failure. What are other examples of times when users' needs were not considered in projects?
3. At which point in the process do you think that empathy is the most critical?
4. How do you know when enough iterations are done with user testing, feedback, and implementation? 

When reflecting on these questions, it may be useful to think of situations in your own projects that worked well (or didn't work well).

## Viewing: Designing for people, not problems (20m, video)

Here we're going to go a little deeper into human-centered design with two videos. Watch these two videos and at the end we'll answer a few more questions.

<iframe width="560" height="315" src="https://www.youtube.com/embed/0bxtEqM2TQU" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


<iframe width="560" height="315" src="https://www.youtube.com/embed/rmM0kRf8Dbk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

{% capture body %}
<p>
    Human-centered design:
</p>
<ul>
    <li>
        Tests assumptions&mdash;what users say often surprise you! 
    </li>
    <li>
        Cuts waste&mdash;instead of building something and having it fail spectacularly, you invest a bit of time in a prototype and get feedback on those results
    </li>
    <li>
        Helps an approach with questions, instead of solutions
    </li>
</ul>
{% endcapture%}
{% include alert level="no-icon" heading="Always Questioning" %}


### Questions

1. What did you take from each video? Anything that surprised you? 
2. Which points from the videos really resonated with you? How do you think they are received in software development?
3. Prototypes and demos help create proof that an idea as valuable. What value do they have for testing with users? What do they require in order to be useful for feedback?
4. Why do human-centered design? Have you seen its benefits in your work? Or just in your life? 
 
## How do you know if your state is doing this? (30m, solo)

**Timer**: {% include countdowntimer minutes=30 %} 

There are certain “tools of the trade” in user-centered design that you can look for. At the beginning of the process, there is gathering information on the users through data, surveys, and interviews. This can look like taking a look at current systems and how they are used, and then interviewing a few people who use them to discover pain points. 

As the development process continues and there are early demos and prototypes, the iteration and testing process begins. Users try these early versions of the tool and give feedback that is incorporated and ideally, re-tested with the users until the product has improved enough to move to further stages in development. This is the bulk of the cycle of the movement. Hopefully, after enough rounds of testing and user feedback, the final product is basically complete and only needs one final user test to check in before its release. 
Think about projects in your own state. Where are they getting this right or wrong? 

Think if they include in their plans for the projects:
- User research&mdash;like surveys, testing, or interviews with users
- Evaluation&mdash;compiling data from actual users, via web traffic, tests, or surveys and interviews
- Feedback&mdash;Using evidence from their users to make revisions to their tool based on evidence and user feedback

Pick a couple of examples of this in your state’s current projects&mdash;maybe one that looked good and one that didn’t. We’ll discuss these when we gather as a group.

{% include shared-experience-prompt.html %}
## Discuss in Community (1h, group)

Come together with your colleagues for a conversation.

You can click on the timers below to help keep yourselves on track.

1.  **Check in**. {% include countdowntimer minutes=5 %} First, check in with each-other. How is everyone doing? Take a moment to share something positive from the week, either at work or at home.
2.  **Understand**. {% include countdowntimer minutes=20 %} Next, take some time to discuss points where you were confused or questioned your material. This would be a great place to probe ideas; help each-other unpack why you feel this way about the readings.
3.  **Reflecting**. {% include countdowntimer minutes=20 %} Bring examples from your own states on how they currently incorporate users. Bring questions for your state’s projects if how and when they consider the end user are unclear. As a group, offer suggestions for how you would like to see the state and/or vendor improve in the next iteration. This could be in the form of questions that you want to ask, or it can be recommendations. Imagine and discuss how the state might respond to those questions or recommendations.
4.  **Questioning**. {% include countdowntimer minutes=10 %} For the last few minutes, take some time to expand on how state project engage end users in their development process. You have your own experiences as SOs, and those experiences should inform your inquiry. What questions (in addition to the ones asked as part of your solo work) do you think you should be asking? Make sure to share those questions back, so they might be incorporated into future versions of these learning materials!
