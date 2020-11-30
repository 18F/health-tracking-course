---
layout: widepage
title: "Data: Bits and Bytes"
dimension: id1.3
overview: |
    Security in applications for federal agencies is absolutely critical; our work is held in the public's trust, and it is up to us, and our vendors, to make sure that trust is not broken. Likewise, having migration strategies and practices in place means that we know how an application will grow, change, and accommodate the needs of users over time---another kind of security, in short.
---

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
