---
title: resources
layout: widepage
permalink: /questioning/
---

# Asking Questions of Software Project Teams

Long ago, during the era of *blogs*, there was a program manager at Microsoft named Joel. He came up with a test. Actually, at the time he came up with the test, he may have already left Microsoft and founded Frog Creek Software. The details of Joel's life and his business dealings are not critical to the story.

Joel wrote a test. More than 20 years later, people still talk about the "Joel Test," and for good reason: it spoke to simple, fundamental things that good software teams do. So, even though his test did not go viral as a 10 second video made by cool kids on the internet, it did help shape how we talk about and practice developing software in teams.

{% include link id="thejoeltest" text="The original blog is still up and on the internet." %}  Right at the top, it lays out twelve simple rules to determine if a software team is going about developing software in a sane way. When reading it, you can hear it as if Joel is asking the questions of another program manager about the software development practices of their team.

1. Do you use source control?
2. Can you make a build in one step?
3. Do you make daily builds?
4. Do you have a bug database?
5. Do you fix bugs before writing new code?
6. Do you have an up-to-date schedule?
7. Do you have a spec?
8. Do programmers have quiet working conditions?
9. Do you use the best tools money can buy?
10. Do you have testers?
11. Do new candidates write code during their interview?
12. Do you do hallway usability testing?

This list has been updated over the years. This article will talk you through the test, and explain (briefly) why each is critical. If your states and vendors can't pass the Joel Test, the project is probably in trouble.

## 1. Do You Use Source Control?

You may have heard of [Github](https://github.com/). It is a company that stores source code for people. That's it. It's... like MySpace, but for code. Programmers can put their code there, and others can look at it, download it, comment on it, and suggest improvements. 

If, somehow, the vendor is not using source control (Github, Bitbucket, or GitLab), things are **very, very bad**. 

For projects with states, the question you want to be asking is "does the code live in a repository that you own?" It is possible that the vendor owns the repository where the code lives. This is not good. Instead, the state should own the repository, and the vendor should use it. This way, if the state ever has to switch to a new vendor, they always are in possession of the most recent version of the code that is running their services.

## 2. Can you make a build in one step?

Imagine if, every time you wanted to start you car, you first had to 1) connect the battery, 2) put gas in the tank, and 3) knit a seatbelt. Besides the fact that a hand-knitted seatbelt would not save your life, this would be a lot of steps, and you would be unlikely to want to drive your car.

It is possible&mdash;and sometimes even common&mdash;for software teams to develop applications that are hard to run. There's one person on the team who "knows" how to set everything up on the server and get things going. As a result, the act of running and testing the software is difficult, and people do it as infrequently as possible.

Your question to states and vendors should be "can this be done in one step?" That is, can someone run *just one command*, and the result is that the software will be:

1. Pulled from version control.
2. Built.
3. Shipped to a server.
4. Run.

If this is not possible, then that means that the state is at the vendor's mercy if they ever want to set up and run the software with another vendor. Today, there are many tools for building and running software that make the 4-step story above not just possible, but *relatively easy*. As part of "owning" the product, the state should know that industry standard tools (Docker is one) are being used to build and run the application being developed by the vendor.

## 3. Do you make daily builds?

As I write code, the question is "does it run." I mean, I can write a lot of code, and it might be *all kinds of wrong*. So, the question is, if we run the software build process, does everything come together correctly?

Today, it is possible to run a build process every time a developer checks code into the version control system (see #1). Because it only takes one command to build and run the software (see #2), it is easy to automate the building of the software every time changes are made. This way, if someone breaks the software, we find out *right away*, and those breaking changes can be fixed.

So, for the modern era, the question should really be *do you build with every commit?* The spirit of it, either way, is making sure that bad code never hangs around in a repository, waiting to surprise us on demo day, or (worse) several months later when it is shipped to the people.

## 4. Do you have a bug database?

Github, Bitbucket, and GitLab (all version control systems) all have bug databases attached to them. For example, here is the bug database for [Tock](https://github.com/18F/tock/issues), a tool used for tracking time within the Technology Transformation Services at the GSA. 

If the vendor does not have a bug database that is up-to-date and actively used for tracking the work that needs to be done, that is a huge problem. It means they don't know what is broken, and what needs to be fixed. A good bug database is an easy way for a state or SO to check and see if work is "ticking over" at a good rate. If bugs lay around for months and none ever go away, that means either 1) nothing is happening, or 2) the vendor is not "gardening" their bugs. (Sometimes, the act of curating or keeping up on things like a bug tracking system is referred to as "gardening," because you shuffle around making sure weeds are pulled, and things are healthy, etc. It's a metaphor.) 

If bugs are being entered, commented on, and fixed on a regular basis (perhaps even daily), that means the vendor is on top of their implementation. If the state is filing tickets when they find things that are wrong, and the vendor is fixing them, and pushing fixes live within days (how? **becuase #1, #2, and #3**), then you've got the core of a really resilient and healthy software project.

## 5. Do you fix bugs before writing new code?

It seems simple. You find a bug. Do you leave it in place, or do you go write a bunch of other code, probably introducing new mistakes?

There are cases where a bug can be left before you move forward. As a software developer, if you have a ticketing or bug tracking system (#4), you might even be discussing or debating how best to fix the bug with colleagues while moving forward. But, if a bug lingers, and is forgotten, that is a problem.

So. Either bugs should be fixed, discussed, and/or sometimes broken apart into new bugs and/or feature descriptions. No matter what, a project manager/program manager should be on top of this, and helping the development team get tickets out of the queue. Wether the vendor always fixes bugs before moving on, or they have some other process for tracking and triaging bugs, it doesn't matter... so long as there is a clear process, they are in communication with their state about it, and it yields working, quality software at the end of the day.

## 6. Do you have an up-to-date schedule?

If projects are being run in an agile manner, this question actually suggests a few things:

1. Are the state and vendor in agreement on a high-level, or thematic, roadmap that looks out 6-months to a year?
2. Is the state part of the planning process for each story epic (typically 6-10 weeks)?
3. Is the state part of the planning process for each sprint (typically 1-3 weeks)?
4. Is the vendor engaging in routine standups as part of their development practice (typicall daily)?
 
If the state and vendor have a clear goal in mind (thematic roadmap), and the state is part of the ongoing development conversation (week-over-week and month-over-month), then all parties should be able to, at any point, tell you how things are progressing towards the end-goal, and how things have been going in the moment. That is, there's a macro view that all parties share, and there is a micro view that everyone is actively engaged in.

## 7. Do you have a spec?

Let's phrase this another way.

A spec might mean "a written plan for code to be written." Having a spec means the following:

1. The team has discussed what they're going to do.
2. They recorded their intent in a way that everyone can see and understand.
3. The code is developed according to that plan.

It could be that the "spec" is a set of tickets entered into the bug tracker as part of a planning session. (In agile, this planning session is sometimes called a *sprint backlog*). The reason for publicly recording it is that a state can be part of the sprint planning process, and see what is going to happen over the next 2-3 weeks. Then, as developers engage in that work, it is easy to see if they are doing work that is "on plan," or if someone is either 1) confused or 2) wandering off on their own, and need to be lassoed back in.

Whatever it looks like, it is best if large software projects are supported by a practice of continuous, visible documentation. Work should not happen in darkness. A good process, with good people, can still yield bad software. But, if the process is open and transparent, it is easy to see where the team made a mistake, and in conjunction with all of the other guidelines in this list, it is *easy* to recover. If the planning and documentation is carried out in secret, is invisible, or otherwise absent, then errors are often discovered late, and it costs a great deal of time and money to undo those mistakes.

## 8. Do programmers have quiet working conditions?

Do you like working in an open-plan office with lots of noise? **I don't.**

If you're going to ask people to do work that requires a high degree of concentration (programming does), then the question becomes *do they have a good environment in which to do that work*? 

If the vendor is providing their programmers with shit conditions, the state should consider finding a better vendor. People who are treated well do good work. People who are treated like shit struggle to do good work. (Do you like being an at-will employee with an abusive manager? **I don't.**)

These are things that, really, need to be part of an RFQ and contracting process. Some questions in this space might not even be allowed under the FAR. (Note, this webpage is not a contract, and is not bound by the FAR... therefore, expressing some strong opinions that we spend the peoples' money on companies that create equitable and just working conditions for their employees is completely reasonable, even if you choose to disagree.) However, people who are respected and treated well do better work. People who are abused, demeaned, threatened, or life day-to-day wondering what new act of violence will befall them (for which they have no recourse) do not do good work. 

## 9. Do you use the best tools money can buy?

Yes, we all know stories about the shade tree mechanic who could fix anything with a screwdriver and some chewing gum.

I'd rather our unemployment systems are not written that way.

Do the developers working on these projects have the equipment they need to do their jobs well? It's a simple question. If you're going to be working all day, every day, on a demanding and complex task, the simple question is "do they have good tools?" 

If you talk to the developers and they're nothing but a bucket of hurt and complaints, the answer is *no*, they don't.

If the developers say "I asked for a second monitor, and my manager said 'of course!,' and it has made my day-to-day work soooo much better!," then it sounds like they're getting the tools they need without having to fight up, down, left, and right for those tools.

**Ask the people doing the work**. They'll tell you. 

## 10. Do you have testers?

This is a bit dated. 

We might want to ask two or three other questions, instead.

### 10a. Are automated tests written before code?

If the team is developing a plan at the start of an epic, and new code is going to be written, then the best thing they can do is write tests for that code before they write the code itself. Why?

#### An Example: Multiplication instead of Addition

Imagine you are writing a piece of code that adds two numbers. You might write this:

```python
def addTwoNumbers (a, b):
  return a * b
```

Because this code takes in two numbers, and gives back one number, it is *kinda* the same as addition. That is, if you want to add two numbers, the result is a single number. So, computations that rely on addition will, actually, work just as well if the numbers are multiplied. Why? Because the *kind* of information going in, and the *kind* of information going out is the same.

However, this mistake (of multiplying instead of adding) can be caught if we write some tests first.

```
addTwoNumbers(0, 0) shouldbe 0
addTwoNumbers(0, 1) shouldbe 1
addTwoNumbers(1, 0) shouldbe 1
addTwoNumbers(1, 1) shouldbe 2
```

If we were to run those tests on our bad code (where the developer chose to multiply instead of add) we would get the following:

<pre>
addTwoNumbers(0, 0) shouldbe 0 <span style="color: green; font-weight: bold;">CORRECT</span>
addTwoNumbers(0, 1) shouldbe 1 <span style="color: red; font-weight: bold;">ERROR</span>
addTwoNumbers(1, 0) shouldbe 1 <span style="color: red; font-weight: bold;">ERROR</span>
addTwoNumbers(1, 1) shouldbe 2 <span style="color: green; font-weight: bold;">CORRECT</span>
</pre>

Zero multipled by zero is zero. Zero added to zero is zero. So, if the developers had only written one test, *that test would have passed*. It would have passed because addition of two zeros and the multiplication of two zeros both produce the same result. *That's bad*.

However, we wrote enough tests to demonstrate both 1) our understanding of the code we're trying to write as well as 2) to catch errors in our implementation. If we change the `*` to a `+`, the code will now run correctly.

#### Wrapping Up the Example

The moral of this story: a team that writes tests before they write code is demonstrating, *in code*, that they understand what their code is supposed to do. And, those tests become part of the code, so if a future developer makes changes, the tests will make sure that everything *still* works correctly.

Good software has tests. That's all there is to it.

### 10b. Are tests run on every commit?

Every time a developer checks in code, are all of the tests run? Do the tests all pass?

If so, the code (probably) didn't break anything. I say "probably" for the simple reason that tests do not necessarily catch all bugs. But, if the team is working hard to make sure they have tests that check as much of the code as possible (this is referred to as "code coverage"), then there is a good chance that there will be fewer catastrophic errors down the line (at time of release) than if there were no tests along the way.

A vendor who cannot, or otherwise will not, develop comprehensive tests for their software is not a good vendor, and should be dropped. 

### 10c. Are demos carried out at the end of every sprint?

The {% include link id="deriskingguide" text="18F Derisking Guide" %} has, in its [State Field Guide](https://derisking-guide.18f.gov/state-field-guide/) section, some words on [demos not memos](https://derisking-guide.18f.gov/state-field-guide/#require-demos-not-memos).

If the state, and for that matter, the SO, can actually use the software at the end of every sprint to explore and try things, then that's a good final "check" that the vendor, in conjunction with the state, are developing high-quality software. 10a and 10b, as methods, will help the developers get to a point (along with #1, #2, #3, and #4) where they are confident that the software will work, and work well. 

## 11. Do new candidates write code during their interview?

We're going to call this "out of scope" for the purposes of this list. However, as part of an RFQ or QASP, perhaps you might want to speak to the equitability of the hiring practices in place at the vendor. (This may not be allowed under the FAR... so, it might also just be fantasy.)

The [18F Engineering Hiring Guide](https://eng-hiring.18f.gov/) lays out a transparent process that aspires to be equitable in its treatment and selection of candidates for technical positions within the org. Working to eliminate bias in the hiring process is critical to developing a diverse and, therefore, excellent development team.

Asking candidates to write code on a whiteboard as part of an interview is bullshit. It isn't a test of their ability to develop software; it's instead a test of their ability to come up with an answer to a contrived question, on the spot, during a high-stress conversation. Real code is never written this way, and this practice is discriminatory and abusive (at best). So, if it comes up somehow, you have been warned. 

### 12. Do you do hallway usability testing?

This final bullet in Joel's test has not aged well. "Hallway usability testing" is asking someone, in the hallway, if they have 3 minutes to look at a screenshot and say whether they think it looks good. **This is not how to test software**.

Are *actual users* involved in the design and testing of the software? This does not mean some VP at the vendor says "I like this." It means that The People of the United States are involved in the ongoing testing of the software. If the software is intended to support SNAP enrollment, then people who need to enroll in SNAP should be *paid*, *by the vendor*, to be part of their user testing pool.

{% comment %}{% include link id="" text="" %}{% endcomment %}

There's a lot more to say about the modern design and testing of software. {% include link id="methodsguide" %} has an entire section on how we {% include link id="vsp18f" text="validate software products" %}. If you only read about those methods ({% include link id="cs18f" text="card sorting" %}, {% include link id="mvt18f" text="multivariate testing" %}, {% include link id="ut18f" text="usability testing" %}, and {% include link id="vpt18f" text="visual preference testing" %}), you'll be a long way towards having an understanding of what it means for a state or vendor to take ongoing testing and validation of the software product seriously. 

Fundamentally, if the state and vendor have a 1) clearly articulated process to 2) involve real users 3) on an ongoing basis, then they're in a pretty good place. From there, it's a question of how well the feedback from those tests are rolled back into the development process. 

# In Conclusion

The {% include link id="statefieldguide" %} portion of the {% include link id="deriskingguide" %} recommends that you [ask technical questions](https://derisking-guide.18f.gov/state-field-guide/#ask-technical-questions-of-agencies). 

The Joel Test is a set of 12 questions that you can ask about a software project that starts to shed light on the daily practices of a vendor, and their relationship with a state. (Ultimately, the State Field Guide recommends that states develop their own expertise, in house, to oversee and ultimately deliver software.) You can use these questions as a starting point for digging into the technical aspects of software projects, and (in keeping with the [learning goals for this course]({{ "/rubric/" | prepend: site.baseurl }})), become more expert yourself in:

1. Assessing whether your state is on track for success,
2. Asking questions about the projects in your states, listening to/understanding the answers, and calling bullshit when necessary,
3. Developing strategies for guiding your states to better outcomes, 

all of which are important for your own development and self-confidence in the work you do every day. 