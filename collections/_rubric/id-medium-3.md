---
layout: lesson
title: "Constant Vigilance!"
dimension: id2.3
overview: |
    In the Harry Potter universe, "Mad Eye" Moody has a magical eyeball that can swivel around in his head to constantly watch in all directions. With software systems, we use the term <em>monitoring</em> to watch not only how our software is operating, but also how the servers provide that software, and how the network delivers the bits, and... and... <em>and</em>. In other words, excellent monitoring <b>is</b> constantly vigilant and we have tools that help us make sense of the deluge of data. This lesson broadly explores monitoring and speficially explores the importance of monitoring for security.
---

This lesson involves two, hour-long listens. You should go ahead and get your podcast player out and get ready to go for some walks. An hour-long walk is a great health benefit to you and hopefully gives you a headspace to concentrate while enjoying some fresh air.

This lesson will take roughly 5 hours to complete, making it one of the longer lessons in the course. However, it covers quite a bit of ground and touches upon the critical dimension of *security*, which we really could spend an entire course on! But sadly, we can only give you the surface-level skim of many topics in this course. To that end, we'll touch on a couple of questions &mdash; "what is monitoring?" and "how can it help me secure my systems?"

**NOTE**: As with all of our viewing/listening choices, we are not attempting to endorse or otherwise promote any product or business. 

## The Art of Monitoring (1h, solo)

The first conversation in this lesson is {% include link id="taomwjt" text="The Art of Monitoring" %}. It comes from the {% include link id="sed" text="Software Engineering Daily" %} podcast and was recorded back in 2016. James Turnbull is the author of a book on monitoring (called *The Art of Monitoring*), and this podcast does a good job of providing a high-level view of what monitoring is, why it's important, and how it can be used to create good business benefit.

We want systems deployed by the state for The People to be #1) reliable and #2) robust. In addition, we want to know where and when they can be improved. Good monitoring gives us the information we need to know if #1 and #2 are true, as well as inform whether or not there are spaces where we can improve the software or stack as a whole. 

It is possible that none of the systems running in your states have any modern monitoring in place. If they do, you should be able to see the information dashboards and get *plain language explanations* of what those dashboards are saying. If they don't exist, it means that a state is running software for hundreds of thousands of people (in a state like Maine) or even many millions of people (like California or New York) without knowing anything about what their systems are doing or why. This is... *probably* a *big* problem.

### Note and Reflect (1h, solo)

When you're done, sit down for 30m to 1h. Bring the podcast back up if you need to and make some notes in your notebook.

1. What were the key points made by the author that you think are "most important" about monitoring?
2. What questions does the podcast raise for you about the systems running in your state?
3. What questions would you like to ask your state about the monitoring of their health IT systems?

Be prepared to share your questions with the larger group later.

## Security Monitoring (1h, solo)

As we write this lesson, the {% include link id="solarwinds" text="SolarWinds hack" %} has been big in the news. This hack involves security monitoring software that was, itself, compromised. This means state and government systems trusted SolarWinds to provide software that would monitor the safety of their systems, but instead SolarWinds shipped software that was explicitly compromised by state actors. This kind of threat is *extremely* difficult to protect against, but it is not impossible and good monitoring and alerting on the part of more government systems might have helped us learn about the hack sooner.

The second podcast in our lesson is titled {% include link id="smwjw" text="Security Monitoring" %} It involves a conversation with Jeff Williams, the CTO of a firm that produces security monitoring software. 

Again, go for a walk. Jeff talks about how we build software (which involves using software that is built on top of software which is built on top of software...) and raises the question of how we monitor or otherwise keep track of the *security* of all of the layers of that stack.

### Note and Reflect (1h, solo)

When you're done, again, sit down and reflect. I would claim that someone with a security mindset begins with the premise that **everything is bad**. The question is then "how can I make things less bad, and keep track of it along the way?" 

What questions would you ask your state about the security of their systems? When compromised, these systems have health, financial, and personal information about the people of the United States, and (in some cases) some of the most vulnerable people in our country. Your questions about how these systems are secured and how they are monitored for security could be a critical line of defense for health IT systems as they are built.

Here's a few to get you started:

1. How are the states' systems deployed? Are they built on open or closed tools?
2. Are those locked down and access limited? How? 
3. What tooling is in place to monitor access to those systems and what alerting exists when access patterns change? Who is alerted? 
4. Are there processes in place for when security problems arise? Where are they documented? 
5. Does the state and vendor test the security of these systems? Do we know those monitoring and alerting systems work? 
6. The systems being developed by the vendor are one of many layers. How does the vendor monitor the systems that they build and deploy?
7. Who has access to that monitoring? Is it presented in a manner that is easy to understand? 
8. Is monitoring information regarding vendor code regularly used as part of improving the software and its performance/usability?
9. Can you see the dashboards and/or reports generated by the monitoring systems in place? If so, is it 1) clear and usable or 2) complex and opaque? If you cannot see this data, why not?


{% include shared-experience-prompt.html %}

## Discuss in Community (1h, group)

Come together with your colleagues for a conversation. The goal of this conversation is to bring together the listening and reflection that you've done alone and with a partner. 

You can click on the timers below to help keep yourselves on track.

 **The facilitator should open up a shared document that the group can use to take notes before the session starts.**

1.  **Check in**. {% include countdowntimer minutes=5 %} First, check in with each-other. How is everyone doing? Take a moment to share something positive from the week, either at work or at home.
2.  **Understand**. {% include countdowntimer minutes=20 %} What questions do you have about monitoring systems? Share out the points where you were less clear and see if the group can help you come to a place of greater understanding and insight.
3.  **Questioning**. {% include countdowntimer minutes=5 %} You've thought about questions you could ask your states. Using the shared document provided by the facilitator, transfer your questions into that document. You can type them in or copy-paste them. Take 5 minutes to get that information into one place that everyone can see.
4.  **Sharing**. After capturing those questions, have one member of the group read them out.
5.  **Strategize**. {% include countdowntimer minutes=30 %} The big question is this: **how can you transform the practices of your state to be more robust and secure?** As a group, discuss the questions you can ask and (to a lesser degree) the practices you currently see or don't see. Attempt to come up with a refinement on the questions your cohort has developed, so that you have a focused and revised set of 5-10 questions that you can use to guide conversation with a state regarding systems and security monitoring. (If you need two lists of questions, one for systems monitoring and one for security, go ahead... always, do what makes productive sense to the group!) 
6.  **Share Out**. {% include countdowntimer minutes=5 %} Make sure you've captured your questions in a form that can be shared more broadly. Put an introductory note on the questions and share them out to colleagues. Create an open space in your team for people to have coffee with you (virtually, as need be) to discuss the questions and the context for your thoughts on this. 
