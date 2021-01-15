---
layout: lesson
title: "Putting Software Into Production"
dimension: id2.1
overview: |
    It's one thing to write a piece of software. It's another for people to use it. That involves "putting the software into production" or "shipping the software." Many terms are used, but at the end of the day, it means that people will find ways to break what you thought was ready for prime time... 
---


# Once Upon a Time

[Bob](https://www.youtube.com/watch?v=5ozrXNRAUas) is a fictional character in the world of software. He's the guy who knows everything, but doesn't tell anyone else what he knows. When it comes to taking software into production, he would be the person who takes the work of the development team and... *somehow*... gets it onto the server, connects it up to the databases, and "makes it work."

This is bad.

As much as we love Bob, this is now how software should go into production. It is, however, how things have happened too often in the past, and (in some places) still happens. As a State Officer, M.D., your job is to discover where Bob is and encourage states to... help Bob develop new practices and habits.

# Strategies for Deployment (15m, solo)

**Timer**: {% include countdowntimer minutes=15 %} 

What follows are a series of three exercises that you can undertake alone or with a partner. They're intended to get you actively thinking about, questioning, and researching practices around the deployment of software systems. Just reading the content is good; actively questioning and growing the content in your own notes and practices is better.

## Five Strategies (30m)

**Timer**: {% include countdowntimer minutes=30 %} 

To deploy software into production, there's a few things people can do. In his blog post {% include link id="dtp5tps" %}, Christian lays out five strategies for making the path from development to production easier.

1. Automate As Much As Possible
2. Build and Pack Your Application Only Once
3. Deploy the Same Way All the Time
4. Deploy Using Feature Flags In Your Application
5. Deploy in Small Batches, and Do It Often

You can read the article (and should), as it's pretty plain-language and short. When you're done, pull out the notebook. For each one of these statements, *write down some questions*. In particular, you should be thinking about your ongoing conversations with the state and its vendors. What questions could you be asking of the state that would allow you to begin to understand (for example) how much of their deployment system is automated? What questions might begin to help you understand if things are deployed in a consistent way week after week and month after month?

## A DevOps Primer (45m solo, 30m small group)

**Timer**: {% include countdowntimer minutes=45 %} 

{% include link id="kileynichols" text="Kiley Nichols provides a primer on DevOps" %} that answers some key questions (what is it?) and then summarizes the value of devops practices in five ways:

1. Reduced Failure Rate
2. Time to Market
3. Higher-Quality Software
4. Reduced Risk
5. Reduce Costs

The core devops cycle she outlines is:

1. Development and Build
2. Testing
3. Integrate New Functionality
4. Continuous Deployment
5. Monitoring

At this point, **this should look very, very familiar**. If you have been working through the health rubric in a cyclic manner&mdash;visiting the highest priority elements, then the medium-priority elements&mdash;you will have seen elements of all of these practices woven throughout the rubric. While it is not explicitly how the Health Tracker was developed, you might be inclined to believe that the HT is actually a secret advocacy tool for devops!

*It is, and it isn't*. The Health Tracker was not developed by starting with devops, and then developing rules and recommendations. Instead, it is that these practices (testing before development, continuous deployment, and so on) are the culmination of decades of experience by thousands of thousands of software developers and systems engineers. These experiences are held and practiced by the engineers, UI/UX, product managers, and content experts at 18F; as a result, it is somewhat unsurprising that some of these dimensions therefore emerged as the tracker was developed. 

**Read the article**, and when you are done, **do some research**. Specifically, with a group of colleagues, you should each pick one or two of these dimensions of the devops cycle. Then, armed with your favorite search engine, start scouring the internet. Your job (as individuals) is to find resources like the following:

1. What are articles that describe best practices regarding (say) the practices and tools that support the development and building of software systems?
2. What are videos that help convey some of these ideas in plain language?
3. What are tools that are used in this work? For example, what kinds of software tools or products are used for continuous deployment (CI/CD) or the monitoring of systems?

For each resource you find, add it to a document, and make a few notes about why that link/resource is of interest.

**Timer**: {% include countdowntimer minutes=30 %} 

**When you are done, come back together as a group**. Open a shared document, and paste your resources in, and take turns presenting what you found. What will result is a catalog of resources and tools that you might expect to see states and their vendors putting into practice when they are engaged in a healthy devops cycle.

# Contractualizing DevOps (30m, solo)

**Timer**: {% include countdowntimer minutes=30 %} 

You've done some research, some conversation, and now it would be good to revisit the basics.

<iframe width="560" height="315" src="https://www.youtube.com/embed/UbtB4sMaaNM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

The reason for coming back to the basics is to revisit the fundamentals in light of *contracts*. Our question to you is this:

{% capture body %}
<p>
    If you were reviewing a contract for new or ongoing work right now, what would you most want to see in the QASP?
</p>
{% endcapture %}
{% include alert level="no-icon" heading="Your Dream QASP" body=body %}

Take a few minutes to try writing a draft QASP element that would capture what you would like to see. 

| **Deliverable** | Some text describing what you would like to see as a contractual deliverable. For example, *Tested Code* is a dimension of the 18F QASP. |
| **Performance Standard(s)** | How will you know when this dimension of the QASP is met? |
| **Acceptable Quality Level** | If you can, put a number on it. In terms of code testing, we say 90% of all code must be covered by tests. |
| **Method of Assessment** | Is this automatic? Manual? Something else? |

Don't push on this for more than 30 minutes. You'll have time to come back around with your peers to wrestle with this. For now, do your best to see what you come up with under time pressure. 

Do this in a word processor of some sort, and use a two-column table for your QASP element (so it looks just like the table above). This will make it easier for your colleagues when you come back together.
# Your Mini-QASP (1h, group)

**Timer**: {% include countdowntimer minutes=90 %} 

Finally, it's time to come back together with your learning cohort. *This session will want more time for conversation and reflection than some other sessions. If necessary, you can do the work and schedule a 30m reflection meeting separately*.

Before you get started, remember that **the best contract is one you never need to use**. So, when we talk about an "adversarial perspective" on your QASP elements, we're asking you to imagine a situation where you're now falling back on the QASP. This is rarely "good times," so you are imagining what you're trying to capture (succinctly) that provides the state (not the vendor) with protection in the case that things are no longer being delivered in a high-quality manner.

1.  **Check in**. {% include countdowntimer minutes=5 %} First, check in with each-other. How is everyone doing? Take a moment to share something positive from the week, either at work or at home.
2.  **Understand**. {% include countdowntimer minutes=10 %} Next, take some time to discuss points where you were confused or questioned your material. Before diving in, it's good to start with questions where things might still be unclear.
3.  **Consolidate**. {% include countdowntimer minutes=10 %} Open a shared document, and everyone should paste their QASP elements into the shared document. Then, take a few minutes to read through everyone's QASP elements.
4.  **Questioning**. {% include countdowntimer minutes=30 %} Now that you've read through everything, take 3-5 minutes on each element. First, have the author present the QASP element - just take one minute to highlight what you were aspiring to with the element. Then, as a group, *revise* the element. This does not mean *tear apart* or *denegrate*, but instead look at it from an adversarial perspective. What if someone didn't want to do the work, and was looking for a way to get out of it? See if you think the dimension needs cleanup/simplification/etc. Remember that *more* is not necessarily *better*.
5.  **Reflect**. {% include countdowntimer minutes=15 %} When you're done&mdash;and you may need to force yourself to move on so that you get to spend some time on everyone's QASP elements&mdash;take some time to reflect on the process. 
    1.  What surprised you about this process? Was it easier in places than you expected? Harder?
    2.  What was familiar about this process? Was the act of writing the QASP familiar? Was it the process of imagining how things might go well, or go wrong?
    3.  What will you take away from this process? As you visit future contracts, what do you hope to carry forward as part of your practice or mindset?
