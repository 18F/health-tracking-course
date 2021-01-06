The State Officer, M.D. (SOMD) site will need some care and feeding over time. This document captures the likely process that ongoing maintenance and development will entail.

# About the site

## How it's built
The entire site is [a Jekyll site](https://jekyllrb.com/). This is a commonly-used open source framework for generating static websites. If you are not familiar with Jekyll, welcome! The Jekyll site is a great place to learn more and googling for most anything regarding jekyll will turn up lots of resources.


## Site structure 

This section tells you how the site is structured, just in case you need to find something for an edit.

## _data

In the `_data` folder are three critical YAML files, which operate like data storage units.

* `navigation.yaml` builds the drop-down menus at the top of every page. Editing this file will let you add or remove menu links.
* `resources.yaml` is a list of all the resources used throughout the courses. There is an include that we then use to pull data out of this file. Think of this as a "link database."
* `rubric.yaml` builds the Health Rubric. It is used everywhere rubric dimensions are rendered.
    * Pay attention to the `id:` row -- this reappears when referencing the lessons in the course overview pages.

## collections

There are three Jekyll collections in this site, which are all housed in the `collections` folder.

### _courses 

The `_courses` folder has one subfolder for each course on the site (one - five). In each subfolder, you'll find an `overview.md` file which is the course overview page. This pages consist of a short description and a link to the lesson pages. This file is what you would edit to change what's on the course overview pages.

#### Editing a course page 

To change the title or the lessons that appear on the page, you'll have to edit the header in the `overview.md` for that course.

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

To add or remove a lesson from a course page, add or remove it from the `lessons:` list. You can find which row of the Rubric to add or remove from looking at the corresponding `id:` row in `/_data/rubric.yaml` 

* `_rubric` is where all of the lessons live. Each dimension of the rubric has one or more lessons associated with it. Those lessons are then woven together to form courses.
    *This is where you'll save new markdown files to add lessons*


* `_pages` are other static pages on the site. For example, the Joel Test content and Agile practices overview are both examples of static pages.

## assets

All images, CSS, Javascript, and the like live here.

## _includes

Includes define text/HTML/code once and then re-use it throughout the site. These act as shortcuts to reuse the same pieces in the course and lesson pages.

* `airtable-post` and `airtable-pre` generate the includes for linking to the Airtable pre-content and post-learning surveys.
* `alert` is used to generate pop-out alerts on lesson pages.
* `breadcrumbs` is used to generate a breadcrumb element that shows up in some lessons.
* `countdowntimer` is used throughout the lessons to create the cute Javascript countdown timers.
* `course_lesson_list` generates the list of lessons for a course overview page.
* `course_lesson_summaries` then embeds the overviews from each rubric lesson, and the dimensions themselves. Used on course overview pages.
* `indicator` is used in the course content overview.
* `link` is used to reach into `resources.yaml` and extract links. This is used everywhere. Change cautiously.
* `resources` is used to render out sections of the resources page.
* `rubric` renders out a dimension from the rubric itself, given a designator. You'll find the designator from `rubric.yaml` file that lives in _data

Changing any of these will change content all over the site. Be careful when doing so.

## _layouts

These are the scaffolds for every page on the site. Content is flowed into them. Changing these changes the look and feel of the entire site, potentially.

`widepage` is used throughout the site for many of the pages.

## CNAME

This is where you should put the DNS entry that the site will "live" at. It suggests that a CNAME entry has been created on the appropriate DNS server, and it redirects to `state-officer-md.github.io`. The [github documentation on this should be considered authoritative](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/configuring-a-custom-domain-for-your-github-pages-site).


## LICENSE

Our work, as employees of the federal government, is free for all. Any future contributions should be made under the same license. This includes individuals as well as vendors; all contributions, edits, etc. will become CC0/public domain upon offering.

# How to update lessons

TKTKTKTKTKTKTKTKTKTKTKTKTKTKTKTKTKTKTKTKTKTK

If you want to add new content, do this.
* Step 1
* Step 2

## How to incorporate SO feedback

    TKTKTKTKTKTKTKTKTK




# That's It.

There is always more to be said, but it will not be said here. 
