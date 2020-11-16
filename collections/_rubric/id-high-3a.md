---
layout: widepage
title: Managing and Migrating Data
lesson: 4
indicator: development
priority: high
visible: true
date: November 10, 2020
course: 2
overview: |
    Security in applications for federal agencies is absolutely critical; our work is held in the public's trust, and it is up to us, and our vendors, to make sure that trust is not broken. Likewise, having migration strategies and practices in place means that we know how an application will grow, change, and accommodate the needs of users over time---another kind of security, in short.

dimension: id1.3
---

<style>
.arrow {
    border-right: 10px solid; 
    border-bottom: 10px solid;
    height: 20px;
    width: 20px;
    transform: rotate(-45deg);
}
</style>

# {{ page.title }}

*This dimension of iterative development involves multiple notions of "security," with specific focuses on data and testing. We've broken this up into two lessons; the first lesson&mdash;this one&mdash;focuses on data.*

{% include rubric dimension="id1.3" %}

### Roadmap

In this lesson, we're going to be talking about data, moving it from point A to point B, preserving it as software is updated, and how to keep it safe. This lesson has a lot of detail in it. We're going to start at the bottom (with zeros and ones) and build up to how this information is organized and moved around. 

On one hand, this might be *too* much detail. On the other hand, the details provide some rich context that will help you better understand what states and vendors mean when they're talking about databases... and, more importantly, some of the critical challenges that states and vendors **must** be paying attention to if we want robust, manageable software systems that can be maintained for years/decades.

While it is true you do not need to become an expert in databases to be a State Officer, M.D., it is also true that you need to be able to ask hard questions about these technologies if you're going to help hold states and vendors accountable for producing robust systems that can withstand the test of time. So good luck, dig in, ask questions, and remember that this stuff takes time and practice to master. Onward!

{% include breadcrumbs seq="Bits and Bytes,Databases,Migration,Testing" %}

# Bits and Bytes (20m, solo)

This lesson starts with details, and builds up to big picture. By starting with zeros and ones, the goal is to give you a bit of background and context for the *size* of data. This way, if someone says "oh, we can't move that database... it contains *gigabytes* of data," then you'll know to call BS. Why? Because you'll know that gigabytes are *not* a lot of data.

{% include breadcrumbs seq="Bits and Bytes,Databases,Migration,Testing" highlight="Bits and Bytes" %}

Let's start start with some numbers and arithmetic. If you work with federal budgeting process, you *absolutely* got this. Most everything here is going to be multiplications by 1000.

* A **bit** is either a zero or a one.
* A **byte** is 8 bits. So, eight zeros or eight ones (or some combination).
* A **kilo**byte (or KB) is, therefore, 1000 bytes. (We have a prefix table below.)
* A **mega**byte (MB) is one million bytes, or 1000 KB.
* A **giga**byte (GB) is one billion bytes, or 1000 MB.
* A **tera**byte (TB) is 1000 GB. Its oodles of bytes.
* A **peta**byte (PB) is 1000 TB, or one million gigabytes, or oodles and oodles of bytes.
* An **exa**byte is 1000 PB, or one million terabytes. Bytes just don't factor into it.

### In a Table

| **Prefix** | **Bytes** | **GB** |
| kilo | 1,000 | 0.001 |
| mega | 1,000,000 | 0.1 |
| giga | 1,000,000,000 | 1 |
| tera | 1,000,000,000,000 | 1000 |
| peta | 1,000,000,000,000,000 | 1,000,000 |
| exa | 1,000,000,000,000,000,000 | 1,000,000,000 |

### Some Examples

Those are just number-numbers. They probably don't mean much to you. To put those numbers into context, here's a few examples of digital "things," and their size in gigabytes. 

| Thing | Size | GB |
| A single letter (e.g., the letter `A`) | 1 byte | 0.000000001 |
| [Andromeda Galaxy Desktop Wallpaper](https://cdn.spacetelescope.org/archives/images/wallpaper4/heic1502a.jpg) ([NASA](https://www.spacetelescope.org/images/heic1502a/)) | 1.9 MB | 0.0019 |
| Current Local Coverage Databases ([CMS](https://www.cms.gov/medicare-coverage-database/downloads/downloadable-databases.aspx)) | 21 MB | 0.021 |
| A 50m Podcast (MP3) | 80 MB | 0.08 | 
| CD (Music) | 700 MB | 0.7 |
| [Andromeda Galaxy 40K Resolution](https://www.spacetelescope.org/static/archives/images/publicationtiff40k/heic1502a.tif) ([NASA](https://www.spacetelescope.org/images/heic1502a/)) | 4.3 GB | 4.3 |
| Movie (DVD) | 4.7GB | 4.7 |
| Project Gutenberg (60,000 books) | 80 GB | 80 | 

None of these things are *huge*. And, we might want to put some costs on this, for context. If I want to buy a USB stick today, $15 will get me a stick that holds 128GB. That means I can put all of Project Gutenberg (at 80GB) onto a single USB stick, and have room left over for... 40GB of podcasts, or roughly 500 *hours* of spoken word content. So... in terms of "cost of storage," 80GB is not an "expensive" amount of data.

If I were to use a cloud-based service for storing 80GB, it would cost me $4.80/year (in 2020). So, three years of storage in the cloud would cost the same amount as buying a USB stick. If I wanted to store a petabyte of data in the cloud, it would cost me $60,000/year, or I could do it with 7800 USB sticks costing roughly $117,000. (No... no one keeps a petabyte of data on USB sticks. They do, however, contract for storage on that scale in the cloud. Think, for example, about NASA and satellite imagery, or the NOAA and weather data.)

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

# Migration

Let's check in.

1. You've thought about bits, bytes, and the *size* of data.
2. You've read and thought about the way data is organized in databases. In short, databases look like a bunch of spreadsheets.

Now, my question is this: what happens when you want to **change the database**?

{% include breadcrumbs seq="Bits and Bytes,Databases,Migration,Testing" highlight="Migration" %}

In this section, we'll explore what it means to **migrate** a database, and the kinds of tooling that developers need to have in place to make sure that migrations take place safely.

## An Example: Adding Details to Users

We'll begin with an example. Previously, we suggested that there might be a database table that represents users of a system. These might be people who are applying for benefits of some sort, and therefore we need to represent details about them in our case management system.

**Table: Users v1**

| ID | User ID | Last | First | SSN | Age |
| ... | ... | ... | ... | ... | ... |
| 37 | 103 | Montoya | Inigo | 999-99-9999 | 29 |
| ... | ... | ... | ... | ... | ... |

We'll call this "version one" of the table. We have an identifier for each row (`ID`), a unique `User ID`, and then things like the person's `last` and `first` name, their `SSN`, and `age`. (We'll use `this font` when talking about the names of columns.)

There's 