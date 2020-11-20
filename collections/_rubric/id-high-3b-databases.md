---
layout: widepage
title: "Data: The Database"
dimension: id1.3
overview: |
    Security in applications for federal agencies is absolutely critical; our work is held in the public's trust, and it is up to us, and our vendors, to make sure that trust is not broken. Likewise, having migration strategies and practices in place means that we know how an application will grow, change, and accommodate the needs of users over time---another kind of security, in short.
---


# {{ page.title }}

*This dimension of iterative development involves multiple notions of "security," with specific focuses on data and testing. We've broken this up into multiple lessons.

{% include rubric dimension="id1.3" %}

### Roadmap

We've introduced the notion of bits and bytes in the previous lesson. In this lesson, we're going to talk about how those pieces of data get organized into systems that can be searched and organized: databases.

{% include breadcrumbs seq="Bits and Bytes,Databases,Migration,Testing" highlight="Databases" %}

## Databases (20m, solo)

A database organizes data. Databases can contain words, numbers, images... really, any kind of digital data. Therefore, it is important to have a reference for how big these different kinds of data are. 

A database with one million words will be roughly 8MB in size. **Why?** Because one million words that are around 8 characters long will be one million, 8-byte things, or 8 megabytes.

A database with one million desktop wallpapers will be roughly 2GB in size. **Why?** A desktop wallpaper is 2MB, and we have one million of them. A million megabytes would be a gigabyte, and we have one million 2MB things... hence, two gigabytes.

But more important to our understanding here is what a database looks like, and how it is organized. 

### The LEGO Database

To break things up a bit, sit back, channel your inner child, and revisit the world of LEGO. Danielle Thé provides a concise overview of databases and SQL (pronounced "see-quell"), the ur-language of databases... and she does it with LEGO, in 4 minutes. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/27axs9dO7AE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Data, in CMS Terms

Now that we have visions of LEGO people dancing in our heads, lets imagine we're building a case management system for SNAP. It is, essentially, going to be a database system. We're going to need to keep track of a lot of information:

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

Suddenly, it seems like we're going to need more than one table, and we're going to need to keep them linked and connected to each-other. Now, we might have a table that looks like this:

**Table: Main**

| ID | User ID | Dependent ID | Address ID |
| ... | ... | ... | ... |
| 1 | 103 | 1010 | 203 |
| ... | ... | ... | ... |

The user ID is a number that we have to look up in a different table:

**Table: Users**

| ID | User ID | Last | First | SSN | Age |
| ... | ... | ... | ... | ... | ... |
| 37 | 103 | Montoya | Inigo | 999-99-9999 | 29 |
| ... | ... | ... | ... | ... | ... |

We would use the dependent ID to look up (possibly multiple) dependents in yet a different table:

**Table: Dependents**

| ID | Dependent ID | Last | First | SSN | Age |
| ... | ... | ... | ... | ... | ... |
| 403 | 1010 | Montoya | Mandy | ... | ... |
| 404 | 1010 | Montoya | ... | ... | ... |
| ... | ... | ... | ... | ... | ... |

By arranging data into multiple tables, we keep separate things separate. This often means that we have to use information from one table to look things up in another. This is just like a budget spreadsheet  with multiple tabs; you keep one kind of data in one tab, and different data in another. You bring it all together by linking it row-by-row, or doing VLOOKUPs, and so on. 

Fundamentally, this is how every table in a database is organized. Each column defines the kind (or type) of data that it holds. Each row is a sequence of entries that match the kinds of data defined by the columns. Most rows contain a unique identifier. And, finally, a database is typically made up of many tables.


## Questions about Databases

This slightly more applied example might help you appreciate the complexity of the data that is being managed by these systems. Unfortunately, if this data is organized and managed poorly, it becomes an excuse for lock-in. "Lock-in," in this case, can stem from intentional choices, or it can be the result of poor data management over a long period of time. Your job, as State Officer, M.D., is to begin asking questions and helping guide your state to a place where this data is *not* managed poorly. Instead, we want data that is well-organized, stored in free and open source systems, and managed such that we can backup, migrate, and manage the data in reliable and repeatable ways.

We asked a few questions about bits and bytes earlier. You can now ask a few other questions that start to target the databases themselves.

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

This second set of questions will make people nervous, and very, *very* likely to uncover some very, *very* disturbing truths about the systems being run by states.
