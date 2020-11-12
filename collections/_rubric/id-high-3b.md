---
layout: widepage
title: Securing and Testing Systems
lesson: 5
indicator: development
priority: high
visible: true
date: November 12, 2020
course: 2
overview: |
    NEED NEW OVERVIEW
dimension: id1.3
---

# {{ page.title }}

*This dimension of iterative development involves multiple notions of "security." with specific focuses on data and testing. We've broken this up into two lessons; this is the second of those two lessons, and focuses on securing and testing systems.*

{% include rubric dimension="id1.3" %}

### Roadmap

This lesson is going to involve some bits and bytes. That is, we're going to be talking about data, moving it from point A to point B, preserving it as software is updated, and how to keep it safe. If you're engaging with this material on a one-lesson-per-week timeframe, this is a two-week (4h) lesson, because of the amount of material and thinking we're going to ask you to do.

<style>
.arrow {
    border-right: 10px solid; 
    border-bottom: 10px solid;
    height: 20px;
    width: 20px;
    transform: rotate(-45deg);
}
</style>

{% comment %}

```
 +----------------+       +-----------+       +-----------+       +---------+
 |                |       |           |       |           |       |         |
 | Bits and Bytes +------>+ Databases +------>+ Migration +------>+ Testing |
 |                |       |           |       |           |       |         |
 +----------------+       +-----------+       +-----------+       +---------+
```
{% endcomment %}

{% include breadcrumbs seq="Bits and Bytes,Databases,Migration,Testing" %}

# Bits and Bytes (20m, solo)

The first part of this lesson really is about databases. We're going to start at the bottom (with zeros and ones) and build up to how this information is organized and moved around. On one hand, this might be *too* much detail. On the other hand, the details provide some rich context that will help you better understand what states and vendors mean when they're talking about databases... and, more importantly, some of the critical challenges that states and vendors **must** be paying attention to if we want robust, manageable software systems that can be maintained for years/decades.

{% include breadcrumbs seq="Bits and Bytes,Databases,Migration,Testing" highlight="Bits and Bytes" %}


Let's start start with some numbers and arithmetic. If you work with federal budgeting process, you *absolutely* got this.

* A **bit** is either a zero or a one.
* A **byte** is 8 bits. So, eight zeros or eight ones (or some combination).
* A **kilo**byte (or KB) is, therefore, 1000 bytes. (We have a prefix table below.)
* A **mega**byte (MB) is one million bytes.
* A **giga**byte (GB) is one billion bytes, or 1000 MB.
* A **tera**byte (TB) is 1000 GB.
* A **peta**byte (PB) is 1000 TB, or one million gigabytes.
* An **exa**byte is 1000 PB, or one million terabytes.

### In a Table

| **Prefix** | **Bytes** | **GB** |
| kilo | 1,000 | 0.001 |
| mega | 1,000,000 | 0.1 |
| giga | 1,000,000,000 | 1 |
| tera | 1,000,000,000,000 | 1000 |
| peta | 1,000,000,000,000,000 | 1,000,000 |
| exa | 1,000,000,000,000,000,000 | 1,000,000,000 |

### Some Examples

Those are just number-numbers. They probably don't mean much to you. Here's a few examples of digital "things," and their size in gigabytes. (At this point in history, it is probably useful to think of things in terms of gigabytes.)

| Thing | Size | GB |
| A single letter (e.g., the letter `A`) | 1 byte | 0.000000001 |
| [Andromeda Galaxy Desktop Wallpaper](https://cdn.spacetelescope.org/archives/images/wallpaper4/heic1502a.jpg) ([NASA](https://www.spacetelescope.org/images/heic1502a/)) | 1.9 MB | 0.0019 |
| Current Local Coverage Databases ([CMS](https://www.cms.gov/medicare-coverage-database/downloads/downloadable-databases.aspx)) | 21 MB | 0.021 |
| A 50m Podcast (MP3) | 80 MB | 0.08 | 
| CD (Music) | 700 MB | 0.7 |
| [Andromeda Galaxy 40K Resolution](https://www.spacetelescope.org/static/archives/images/publicationtiff40k/heic1502a.tif) ([NASA](https://www.spacetelescope.org/images/heic1502a/)) | 4.3 GB | 4.3 |
| Movie (DVD) | 4.7GB | 4.7 |
| Project Gutenberg (60,000 books) | 80 GB | 80 | 

None of these things are *huge*. An 80GB dataset (Project Gutenberg) is big, but for context, a 128GB microSD storage card (one of those little things you put in cameras and phones) costs $20, so... in terms of "cost of storage," 80GB is not an "expensive" amount of data.

### Things, In Context

For everyday use in the world of CMS, you can think of things this way:

* If the data is text and numbers, it is probably a small(ish) amount of data. Text and numbers don't take up much space. Unless, of course, you have billions-upon-billions of those numbers. In state data, you'll end up with gigabytes of text and numbers.
* If the data is images and audio, it can start to get big. As the NASA data demonstrates, a high-resolution image can start to get large all by itself. If you have a lot of images, then you need a lot of storage space. In the case of health data, imaging (x-rays, MRIs, and so on) start to take up significant space.
* Movie data gets really big really fast, because it is a stream of images. Most health data is not movies.

Put another way, here's how many three-minute songs you could fit in one (mega/giga/tera/etc.)byte.

| Unit | Songs |
| MB | 1/3rd (1min of a 3min song) |
| GB | 300 |
| TB | 300,000 |
| * | *~100,000,000 songs **ever** written and recorded* |
| PB | 300x number of songs in world |
| EB | 300,000x number of songs in world |

In November of 2020, storage (hard drives) cost roughly $15/TB.

## Questions about Bits and Bytes

As a state officer, you won't have a lot of questions you need to ask about the bits and bytes. That would be a bit like crawling around in the weeds while trying to map the western half of the North American continent; you would risk the "big picture" for the details.

However, it might be good to think about some questions that you *could* ask. For example:

* What is the size, in gigabytes, of all of the data in these systems?
* What *kind* of information is being stored? Are we dealing with textual records, or scans and audio?

This first set of questions can be easily answered. We'll ask some more disturbing questions in the next section...

## Databases (20m, solo)

{% include breadcrumbs seq="Bits and Bytes,Databases,Migration,Testing" highlight="Databases" %}

A database organizes data. Databases can contain words, numbers, images... really, any kind of digital data. Therefore, it is important to have a reference for how big these different kinds of data are. 

A database with one million words will be roughly 8MB in size. **Why?** Because one million words that are around 8 characters long will be one million, 8-byte things, or 8 megabytes.

A database with one million desktop wallpapers will be roughly 2GB in size. **Why?** A desktop wallpaper is 2MB, and we have one million of them. A million megabytes would be a gigabyte, and we have one million 2MB things... hence, two gigabytes.

But more important to our understanding here is what a database looks like, and how it is organized. 

**Databases are like spreadsheets**.

Really. Databases are made up of *tables*, which you can imagine as a spreadsheet. We describe database tables as having *columns* and *rows*, just like a spreadsheet. Columns might be named things like *Name*, *SSN*, and so on. Rows then contain entries, like `Bob` and `999-99-9999`. 

A typical health information system will have between dozens and hundreds of tables.

### A Bit More About Databases

We can do better. 

Let's take the table from above, and turn it into a *database table*.

| Thing | Size | GB |
| A single letter (e.g., the letter `A`) | 1 byte | 0.000000001 |
| [Andromeda Galaxy Desktop Wallpaper](https://cdn.spacetelescope.org/archives/images/wallpaper4/heic1502a.jpg) ([NASA](https://www.spacetelescope.org/images/heic1502a/)) | 1.9 MB | 0.0019 |
| Current Local Coverage Databases ([CMS](https://www.cms.gov/medicare-coverage-database/downloads/downloadable-databases.aspx)) | 21 MB | 0.021 |
| A 50m Podcast (MP3) | 80 MB | 0.08 | 
| CD (Music) | 700 MB | 0.7 |
| [Andromeda Galaxy 40K Resolution](https://www.spacetelescope.org/static/archives/images/publicationtiff40k/heic1502a.tif) ([NASA](https://www.spacetelescope.org/images/heic1502a/)) | 4.3 GB | 4.3 |
| Movie (DVD) | 4.7GB | 4.7 |
| Project Gutenberg (60,000 books) | 80 GB | 80 | 

First, we  can see that there's duplicated information. We never want to duplicate information in a database. So, we'll strip out one of the columns.

| Thing  | GB |
| A single letter (e.g., the letter `A`) | 0.000000001 |
| [Andromeda Galaxy Desktop Wallpaper](https://cdn.spacetelescope.org/archives/images/wallpaper4/heic1502a.jpg) ([NASA](https://www.spacetelescope.org/images/heic1502a/)) | 0.0019 |
| Current Local Coverage Databases ([CMS](https://www.cms.gov/medicare-coverage-database/downloads/downloadable-databases.aspx)) | 0.021 |
| A 50m Podcast (MP3) | 0.08 | 
| CD (Music) | 0.7 |
| [Andromeda Galaxy 40K Resolution](https://www.spacetelescope.org/static/archives/images/publicationtiff40k/heic1502a.tif) ([NASA](https://www.spacetelescope.org/images/heic1502a/)) | 4.3 |
| Movie (DVD) | 4.7 |
| Project Gutenberg (60,000 books) | 80 | 

The column I removed was one that repeated information; that is, the last column (the GB column) already contains the size... so, having that information in two places was redundant. Now, we have two kinds of data in this table:

* Words (characters), and 
* Numbers

Typically, every row in a database has a unique identifier, which is a number. This would involve adding a column back in:

| ID | Thing | GB |
| 1 | A single letter (e.g., the letter `A`) | 0.000000001 |
| 2 | [Andromeda Galaxy Desktop Wallpaper](https://cdn.spacetelescope.org/archives/images/wallpaper4/heic1502a.jpg) ([NASA](https://www.spacetelescope.org/images/heic1502a/)) | 0.0019 |
| 3 | Current Local Coverage Databases ([CMS](https://www.cms.gov/medicare-coverage-database/downloads/downloadable-databases.aspx)) | 0.021 |
| 4 | A 50m Podcast (MP3) | 0.08 | 
| 5 | CD (Music) | 0.7 |
| 6 | [Andromeda Galaxy 40K Resolution](https://www.spacetelescope.org/static/archives/images/publicationtiff40k/heic1502a.tif) ([NASA](https://www.spacetelescope.org/images/heic1502a/)) | 4.3 |
| 7 | Movie (DVD) | 4.7 |
| 8 | Project Gutenberg (60,000 books) | 80 | 

Now, given the "Size of Things" table, I can refer to "item 3," and you'll know I mean the CMS local coverage databases, because you can look at the ID and find the appropriate row. (If this seems like common sense, it's because you probably know spreadsheets, and therefore the basics of working with tabular data is not new to you.) 

## A More Applied Example

Instead of some information about random digital items, instead imagine we're building a case management system for SNAP. We're going to need to keep track of a lot of information:

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

By arranging data into multiple tables, we keep separate things separate. This often means that we have to use information from one table to look things up in another. This is just like a budget spreadsheet document with multiple tabs; you keep one kind of data in one tab, and different data in another. You bring it all together by linking it row-by-row, or doing VLOOKUPs, and so on. 

Fundamentally, this is how every table in a database is organized. Each column defines the kind (or type) of data that it holds. Each row is a sequence of entries that match the kinds of data defined by the columns. Most rows contain a unique identifier. And, finally, a database is typically made up of many tables.


## Questions about Databases

This slightly more applied example might help you appreciate the complexity of the data that is being managed by these systems. Unfortunateley, if this data is organized and managed poorly, it becomes an excuse for lock-in. "Lock-in," in this case, can stem from intentional choices, or it can be the result of poor data management over a long period of time. Your job, as State Officer, M.D., is to begin asking questions and helping guide your state to a place where this data is *not* managed poorly. Instead, we want data that is well-organized, stored in free and open source systems, and managed such that we can backup, migrate, and manage the data in reliable and repeatable ways.

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

# Migration

Up to this point, we've been laying some knowledge foundations. Thinking about the size of data (bits and bytes) and the shape of data (databases tables and so on) are 

This is where, as a state officer, it is really important to start t

{% include breadcrumbs seq="Bits and Bytes,Databases,Migration,Testing" highlight="Migration" %}


