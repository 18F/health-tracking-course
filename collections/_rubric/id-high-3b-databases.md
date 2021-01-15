---
layout: lesson
title: "Data: The Database"
dimension: id1.3-course3
overview: |
    Security in applications for federal agencies is absolutely critical; our work is held in the public's trust, and it is up to us, and our vendors, to make sure that trust is not broken. Likewise, having migration strategies and practices in place means that we know how an application will grow, change, and accommodate the needs of users over time---another kind of security, in short.
federal:
    - agilesoftwaredev
    - empoweredowner
    - infraascode
    - path2prod
state:
    - devops
    - building
    - servicesnotsoftware
---

## Databases (20m, solo)

A database organizes data. Databases can contain words, numbers, images... really, any kind of digital data. In the databases that state systems use, there will likely be text (names, phone numbers, etc.) and possibly some images (scans of identification, paperwork). The important question, though, is less *what kind* of data is in a state's databases, and more *how is it organized*. Ultimately, our questions will lead us to the space of *how movable is that data*, but not quite yet...
### The LEGO Database

To get a quick overview of what a database is, and how it is used, sit back, channel your inner child, and revisit the world of LEGO. Danielle Thé provides a concise overview of databases and SQL (pronounced "see-quell"), the ur-language of databases... and she does it with LEGO, in 4 minutes. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/27axs9dO7AE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Although short, it may be worth taking notes on terminology and the metaphors used here. If you're working with states and vendors, and they can't break down how their data is stored and organized in a simple, clear way, *there are problems*. 

### Data, in CMS Terms

Now that we have visions of LEGO people dancing in our heads, lets imagine we're building a case management system for SNAP. It is, essentially, going to be an interface on top of a database system. We're going to need to keep track of a lot of information:

* People's names
* SSNs
* Address(es)
  * Current
  * Previous
* Dependents
  * Names
  * SSNs
  * Ages
* ...

The challenge for the vendor and state is what happens to this data when it is time to update the application? There's any number of common, but painful, changes that often need to be made, but vendors will claim it is 1) too difficult or 2) to expensive to change. Consider these three examples:

1. Many database systems in the US use a first, middle, and last name. This naming convention completely fails to acknowledge how people are named around the world. {% include link id="sntrad" text="Spanish naming traditions" %} might include the forename *María* or *José*, or even *José María* as a **single** forename. *José María Álvarez del Manzano y López del Hierro* has a compound forename, and two compound surnames (*Álvarez del Manzano* and *López del Hierro*). 
2. Not everyone has a fore and surname. A colleague in the NHS wrote an article for the BMJ titled {% include link id="thesurname" text="The surname I do not have" %}. "My name (one and only name) is Radhika. Until I got married, I was called M Radhika." However, many database systems are written so that it is impossible to leave either the forename or surname blank.  
3. {% include link id="nantrad" text="Native American naming traditions" %} do not map directly onto a first/middle/last name. Pause and consider what it means for a federally funded system to continue, in the 21st century, to continue to disrespect and demean the lives of Native Americans.
 
**It is important to build systems that honor and respect human beings as individuals**. It takes intentionality and effort, but it can, and should, be done. A system that is incapable of honoring and respecting a person's name is unlikely to support them as human beings throughout a benefits application process (for example). And, a vendor or state that does not see that this is a problem, or claims their systems cannot be updated to capture these realities, is likely in need of substantial support and education.

It is true that changing something as fundamental as a name can be invasive and require changes throughout a piece of software. However, if it was well written from the start, then changes to the data and the interface will be manageable, tests will be executed to verify the correctness of the changes, and life will go on. Poorly written systems will fail in horrific ways. This is likely a space where vendors will insist on massive, multi-year contracts to do the work... and a place where states should begin to rethink their contracting practices.

## Questions about Databases (10m, solo)

This contextualized example regarding names might help you appreciate the complexity of the data that is being managed by our systems. Unfortunately, if this data is organized and managed poorly, it becomes an excuse for lock-in. "Lock-in," in this case, can stem from intentional choices, or it can be the result of poor data management over a long period of time. Your job, as State Officer, M.D., is to begin asking questions and helping guide your state to a place where this data is *not* managed poorly. Instead, we want data that is well-organized, stored in free and open source systems, and managed such that we can backup, migrate, and manage the data in reliable and repeatable ways.

The following questions begin to get at the heart of some of the challenges that large, complex information systems might have. There is definitely more you could ask, but these might serve as a starting point for conversation regarding data and the work that needs to be done to represent data as a living, changing thing.

* Who "owns" the systems where the data is stored? The state, or the vendor? (Note: in a cloud context, "owns" might mean that they are using an Amazon cloud service, but the state has full control and access.)
* Who manages the systems where the data is stored? The state, or the vendor?
  * Here, we mean "does the state have the technical capacity to manage the database services?"
* How are the databases in the state's systems backed up?
* Are backups tested regularly? How often?
* Is it possible to automatically restore (successfully) from a backup?
* When was this last tested?
* What processes are in place to both verify and validate the integrity of a database restore? 
* In the case of a database crash, how long would we have to wait for systems to come back online from a restore?
* Is the database layout (they'll call it a *schema*) documented and understood by the software team?
* What is the underlying database system being used to store the state's data? Is it closed, or open? Why?
* How difficult would be it be migrate the data from a closed system to an open system?

This second set of questions will make people nervous, and very, *very* likely to uncover some very, *very* disturbing truths about the systems in place.

## Pause and Reflect (20m, solo)

This is the first of two lessons on data and databases. Before proceeding, pause. 

In your notebook, work through the questions from the section above. Assuming you are familiar with the work in your state(s), answer those questions to the best of your ability. It's OK if you have to write down "no idea" as an answer to some of these questions.

Once you have taken stock, add some additional notes. Asking these questions directly, while fun, might set people unnecessarily on edge. Who might you have some conversation with at the state level who would have some insights in this space? What questions could you probe gently, so that you have a fuller picture of what is going on "on the ground?" 

Reflecting on these questions will prepare you for the next lesson, where we talk about the *migration* of data, and ultimately come together in a group to talk all-things-data.

{% include shared-experience-prompt.html %}

*There is no full-group discussion on databases (yet), as this is the first of a two-part lesson.*