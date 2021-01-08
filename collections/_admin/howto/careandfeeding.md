---
layout: widepage
title: Care and Feeding
--- 

The State Officer, M.D. (SOMD) site will need some care and feeding over time. This document shows where site elements are housed for easy future editing and maintenance.

{% include toc.html html=content h_max=2 %}

# About the site

## How it's built
The entire site is [a Jekyll site](https://jekyllrb.com/). This is a commonly-used open source framework for generating static websites. If you are not familiar with Jekyll, welcome! The Jekyll site is a great place to learn more and googling for most anything regarding jekyll will turn up lots of resources.


## Site structure 

This section walks you through the site's main directories, just in case you need to find something for an edit. In most cases, [you'll need a file in the `/collections/` folder](#collections) to edit site content.

## /_data/

In the `/_data/` folder are three critical YAML files which operate like data storage units.

* `navigation.yaml` builds the drop-down menus at the top of every page. Editing this file will let you add or remove menu links.
* `resources.yaml` is a list of all the resources used throughout the courses. There is an "include" (more on this below) that we then use to pull data out of this file. Think of this as a "link database."
* `rubric.yaml` builds the Health Rubric rows/dimensions. It is used everywhere rubric dimensions are rendered.
    * Pay attention to the `id:` row &mdash; this reappears when referencing the lessons in the course overview pages.

## /_includes/

"Includes" define text/HTML/code once and then re-use it throughout the site. These act as shortcuts to reuse the same items in the course and lesson pages. 
* `airtable-post` and `airtable-pre` generate the includes for linking to the Airtable pre-content and post-learning surveys.
* `alert` is used to generate pop-out alerts on lesson pages.
* `breadcrumbs` is used to generate a breadcrumb element that shows up in some lessons.
* `countdowntimer` is used throughout the lessons to create the cute Javascript countdown timers.
* `course_lesson_list` generates the list of lessons for a course overview page.
* `course_lesson_summaries` then embeds the summaries from each rubric lesson and the dimension rows themselves. Used on course overview pages.
* `indicator` is used in the course content overview.
* `link` is used to reach into `resources.yaml` and extract links. This is used everywhere. Change cautiously.
* `resources` is used to render out sections of the resources page.
* `rubric` renders out a dimension from the rubric itself, given a designator. You'll find the designator (`id:`) in the `rubric.yaml` file that lives in `/_data/`
* `shared-experience-prompt.html` is the text of the small group prompt that appears in lessons throughout the site.

You'll see references to these includes in the body of those pages like so:

~~~

{% include shared-experience-prompt.html %}

~~~

~~~

{% include course_lesson_list.html lessons=page.lessons %}

~~~


Changing any of these will change content all over the site. Be careful when doing so.

## /_layouts/

These are the scaffolds for every page on the site. Content is flowed into them. Changing these can change the look and feel of the entire site.

`widepage` is used throughout the site for many of the pages.

## /collections/

There are three Jekyll collections in this site that are housed in the `/collections/` folder. 

**Most of what you'll need to edit content on the site is housed here.**

 ### /collections/_admin/

This folder houses information about the course and the website itself.

 * `learningcohorts.md` is the rationale behind the learning cohort and the course.
 * `/howto/careandfeeding.md` is the document you're reading right now!

### /collections/_courses/ 

The `/_courses/` folder has one subfolder for each course on the site (one - five). In each subfolder, you'll find an `overview.md` file which is the course overview page. This pages consist of a short description and a link to the lesson pages. 

**Edit `overview.md` to change what's on the course overview pages.**

#### Editing a course page (overview.md)

Header of `overview.md`:

To change the title or the lessons that appear on the page, you'll have to edit the *header* in the `overview.md` for that course.

For example, if I wanted to edit which lessons appear in course 2, I would navigate to `/collection/_courses/two/overview.md` and find this in the header of the file:
~~~

layout: widepage
title: Course Two Overview
lessons:
    - oo1.2
    - sc2.1
    - pf1.2
    - id1.2
    - id1.3-course2

~~~

To add or remove a lesson from a course page, add or remove it from the `lessons:` list. You can find which row of the Rubric to add or remove from looking at the corresponding `id:` row in `/_data/rubric.yaml`. 

You can also make up your own tags if you want a certain course to appear on the lesson page. In the example above, `id1.3-course2` is a tag we created to get `id-high-3.md` to be on the Course 2 page. Just be sure to tag in in both the header of the course page and the lesson page itself. If you peek at both, you'll see we've done this. More on this is in the [naming and number section below](#naming-and-numbering-convention-for-lesson-pages).

Body of `overview.md`: 
 * contains "includes" that pull from the `_includes` folder to build lesson lists and summaries on the page
 * has text on the page for each course overview blurb

### /collections/_pages/

 The `/_pages/` folder holds other static pages on the site. For example, the Joel Test content and Agile practices overview are both examples of static pages.

### /collections/_rubric/

The `/_rubric/` folder contains all of lesson pages on the site. 

**If you need to edit a lesson, you'd look for its markdown file in the `/_rubric/` folder.**

#### Naming and numbering convention for lesson pages

 * Each lesson page has a markdown file named with the Rubric primary indicator, priority level, and position in the full Rubric.
    * For example, the very first row of the Health Rubric is part of the "outcomes orientation" (oo) primary indicator, marked as "top priority," (high) and is the first (1) top priority row. So the lesson page for this row is named `oo-high-1.md`
    * The numbering restarts by primary indicator, then by priority level. So for 2 rows in the state capacity primary indicator that are medium priority, the files are `sc-medium-1.md` and `sc-medium-2.md`
* Each lesson has one or more rows/dimensions of the rubric associated with it, so each lesson page is tagged with the corresponding `id:` for the rubric dimension found in `/_data/rubric.yaml`. This links them to the main rubric page and allows you to pull them into lesson and course pages. For example, if you go to the main Rubric page, `oo-high-1.md` is tagged with `oo1.1`.
    * These id tags are in the header of the lesson pages. So if you went to the header for `oo-high-1.md`, you'd find `dimension: oo1.1` that links it throughout the site.
    
    For another example, in the header of the lesson page `id-high-1.md` (pasted below), you'll see the tag `dimension: id1.1`. This `id1.1` corresponds to its id in `/_data/rubric.yaml`. You'd add this same id to the course page if you wanted this lesson to appear there.

    ~~~

    layout: lesson
    title: "Demos not Memos"
    dimension: id1.1
    overview: |
        The most important thing you can have in a project are demos. That is, working software. If someone gives you a report about a piece of software, the software probably doesn't work. (Ask me how I know.) If someone shows you a video of a piece of software, the software may have worked once. (Ask me how I know.) If someone shows you a piece of software, but they control it, the software barely works. (Ask me how I know.) If someone lets you use a piece of software, they have confidence. It might work, it might break, but they have confidence.

    ~~~

## /assets/

All images, audio, CSS, and Javascript for the site live here.

## LICENSE

Our work, as employees of the federal government, is free for all. Any future contributions should be made under the same license. This includes individuals as well as vendors; all contributions, edits, etc. will become CC0/public domain upon offering.


# C/O, etc

We recommend updating this guide as site structure and editorial decisions change for SOMD. A more technical guide to care and feeding of the site will be created and linked here when hosting information for the site is updated.
