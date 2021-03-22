---
layout: widepage
title: Care and feeding
--- 

This document shows how to maintain the {{site.long}} ({{site.short}}) site. Listed below details how to manage site elements for future content addition, maintenance, editing.

{% include toc.html %}

# About the site

## How it's built
The entire site run on [Jekyll](https://jekyllrb.com/). Jekyll is a commonly-used open source framework for generating static websites. The Jekyll site is a great place to learn more, but a quick internet search for most anything regarding Jekyll will turn up lots of resources.

## How to edit the site

Most of what you'll need to edit the site is in the `/collections/` folder.

### Editing site pages (`/_collections/`)

In the `/_collections/` folder, there are four Jekyll collections ( _admin, _courses, _pages, _rubric) that house the site's pages in Markdown files.

#### Course pages (`/_courses/`)

The /_courses/ folder has one subfolder for each course on the site (one - five). In each subfolder, you'll find an `overview.md` file which is the course overview page. These pages consist of a short description and a link to the lesson pages.

Edit `overview.md` to change what's on a course overview page.

##### Changing the lessons that appear on the course page

To change the lessons that appear on the course page, edit the *header* in the `overview.md` for that course.

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

You can also make up your own tags if you want a certain course to appear on the lesson page. In the example above, `id1.3-course2` is a tag we created to get `id-high-3.md` to be on the Course 2 page. Just be sure to use the tag in both places &mdash; the header of the course page and the header of lesson page. More on tagging in the lesson page headers is in the [lesson naming and numbering section below](#lesson-headers).

Under the header, the body of `overview.md` has text on the page for each course overview blurb and contains "includes" that pull from the `_includes` folder to build lesson lists, rubric rows, and lesson summaries on the page. 

#### Lesson pages (`/_rubric/`)

The `/_rubric/` folder contains all of lesson pages on the site. 

To edit a lesson, look for its markdown file in the `/_rubric/` folder. 

##### Lesson files are named by their place in the rubric

 * Each lesson page has a markdown file named with the Rubric primary indicator, priority level, and position in the full Rubric.
    * For example, the very first row of the Health Rubric is part of the "outcomes orientation" (oo) primary indicator, marked as "top priority," (high) and is the first (1) top priority row. So the lesson page for this row is named `oo-high-1.md`
    * The numbering restarts by primary indicator, then by priority level. So for 2 rows in the state capacity primary indicator that are medium priority, the files are `sc-medium-1.md` and `sc-medium-2.md`

##### Lesson headers

* `dimension:`
    * Each lesson has one or more rows/dimensions of the rubric associated with it. Lesson pages are tagged with corresponding `id:` for the rubric dimension found in `/_data/rubric.yaml`. This links them to the main rubric page and allows you to pull them into lesson and course pages. For example, if you go to the main Rubric page, `oo-high-1.md` is tagged with `oo1.1`.
    * These id tags are in the header of the lesson pages. So if you went to the header for `oo-high-1.md`, you'd find `dimension: oo1.1` that links it throughout the site.
    * For example, in the header of the lesson page `id-high-1.md` (pasted below), you'll see the tag `dimension: id1.1`. This `id1.1` corresponds to its id in `/_data/rubric.yaml`. You'd add this same id to the course page if you wanted this lesson to appear there.
* `overview:`
    * Lesson page headers contain an `overview:` that is used to generate the summaries on course pages via the [includes](#_includes).

* `federal:` & `state:`
    * The `federal:` and `state:` tags in the header control the links to the [18F De-risking Guide](https://derisking-guide.18f.gov/) sections that appear at the bottom of the lesson. 
    * To include a page from the De-risking guide, the appropriate tag is placed in the lesson page header and built using [/_data/](#_data) from `fieldguide.yaml` and the derisking.html [include](#_includes).

~~~

layout: lesson
title: "Demos not memos"
dimension: id1.1
overview: |
    The most important thing you can have in a project are demos, meaning working software. If someone gives you a report about a piece of software, the software probably doesn't work (ask me how I know). If someone shows you a video of a piece of software, the software may have worked once (ask me how I know). If someone shows you a piece of software, but they control it, the software barely works (ask me how I know). If someone lets you use a piece of software, they have confidence. It might work, it might break, but they have confidence.
federal:
    - building
    - constantfeedback
    - infraascode
    - quaspmon
state: 
    - demosnotmemos

~~~
    
#### Static pages  (`/_admin/`) & (`/_pages/`)

 The `/_admin/` folder houses information about the course and the website itself.

 * `about.md` is the course about page.
 * `coursefacilitation.md` is outlines how to faciliate the course.
 * `learningcohorts.md` is the rationale behind the learning cohort and the course.
 * `/howto/careandfeeding.md` is the document you're reading right now!
 
 The `/_pages/` folder holds other static pages on the site. 
 
* `agile.md` is an agile practices overview.
* `joeltest.md` is the "Asking questions of software project teams" page.
* `syllabus.md` is the course syllabus.
* `resources.md`, `rubric.md`, and `rubrictxt.md` all use [includes](#_includes) and YAML files from [/_data/](#_data) to populate the list on the resources pages and the Health Rubric pages.

#### Creating links
To link internally (to other pages on the site), add `| prepend: site.baseurl` to your Markdown links.

Example from oo-low-1-2.md (this example links to another lesson, oo-high-1.md):

~~~

[One of the top priorities in the outcomes orientation primary indicator is the roadmap]({{ "/rubric/oo-high-1/" | prepend: site.baseurl }})

~~~

### Editing repeatable elements (`/_includes/`)

[Includes](#_includes) define text/HTML/code once and then re-use it throughout the site. These act as shortcuts to reuse the same items in the course and lesson pages. They can pull their info from the YAML files in `/_data/`.

You'll see references to these includes in the body of lesson and course pages like so:

~~~

{% include shared-experience-prompt.html %}

~~~

~~~

{% include course_lesson_list.html lessons=page.lessons %}

~~~

Ususally you'll just reference these files in the lesson or course pages above. Changing the files in `/_includes/` themselves will change your content all over the site. Be careful when doing so. 

More information on these files is in the [`/_includes/` site structure section](#_includes).

#### Editing the site menu, resources page, de-risking guide links, and the Health Rubric (`/_data/`)

In the [`/_data/`](#_data) folder are YAML files that store data used throughout the site.

* To edit the site menu drop-downs, edit `navigation.yaml`.
* To edit the resources linked throughout the site, edit `resources.yaml`.
* To edit the links and tags in the De-risking guide sections, edit `fieldguide.yaml`.
* To edit the Health Rubric rows and dimensions (which you likely will not need to significantly), edit `fieldguide.yaml`.

More in-depth information on these files is in the [`/_data/` site structure section](#_data).

#### Changing layouts and templates throughout the site (`/_layouts/`)

To change the template for every lesson page on the site, look in the `/_layouts/` folder for `lesson.html`. 

The `lesson.html` file controls the order and placement of the following elements:
 * Lesson page title
 * Rubric dimension row
 * Table of contents/lesson outline
 * De-risking guide links
 * Airtable feedback form  

Changing the order or content of the [includes](#_includes) in `lesson.html` will change these elements for every lesson page on the site.

## Site structure 

This section walks you through the site's main directories. In most cases, [you'll need a file in the `/collections/` folder](#collections) to edit site content.

### /_data/

In the `/_data/` folder are YAML files which operate like data storage units.

* `fieldguide.yaml` controls the links to the [18F De-risking Guide](https://derisking-guide.18f.gov/). Tags from this file link to specific pages from the guide. To include a page, the appropriate tag is placed in the lesson page header and built using the derisking.html [include](#_includes).
* `navigation.yaml` builds the drop-down menus at the top of every page. Editing this file will let you add or remove menu links.
* `resources.yaml` is a list of all the resources used throughout the courses. There is an [include](#_includes) that we then use to pull data out of this file. Think of this as a "link database."
    * For example, in the oo-high-1.md lesson, you'll see `({% include link id="capreu" %})`. This tells us that the link is tagged with the id (`uid`) "capreu" in `resources.yaml`. You can find the link that appears under this tag, "Creating Agile Product Roadmaps Everyone Understands" in this yaml file. To add new resources, you'd need to add an `uid` and title, author, and url to this file.
* `rubric.yaml` builds the Health Rubric rows/dimensions. It is used everywhere rubric dimensions are rendered.
    * Pay attention to the `id:` row &mdash; this reappears when referencing the lessons in the course overview pages.

### /_includes/

"Includes" define text/HTML/code once and then re-use it throughout the site. These act as shortcuts to reuse the same items in the course and lesson pages. 

* `airtable-post` and `airtable-pre` generate the includes for linking to the Airtable pre-content and post-learning surveys.
* `alert` is used to generate pop-out alerts on lesson pages.
* `breadcrumbs` is used to generate a breadcrumb element that shows up in some lessons.
* `countdowntimer` is used throughout the lessons to create the cute Javascript countdown timers.
* `course_lesson_list` generates the list of lessons for a course overview page.
* `course_lesson_summaries` then embeds the summaries from each rubric lesson and the dimension rows themselves. Used on course overview pages.
* `derisking` embeds relevant links to the [18F De-risking Guide](https://derisking-guide.18f.gov/). The links are controlled by header tags in the lesson pages under "federal" and "state". The specific tags and associated pages are stored in `fieldguide.yaml` in [/_data/](#_data).
* `indicator` is used in the course content overview.
* `link` is used to reach into `resources.yaml` and extract links. This is used everywhere. Change cautiously.
* `resources` is used to render out sections of the resources page. This probably won't need editing in the future unless it is somehow malfunctioning.
* `rubric` renders out a dimension from the rubric itself, given a designator. You'll find the designator (`id:`) in the `rubric.yaml` file that lives in [/_data/](#_data).
* `shared-experience-prompt` is the text of the small group prompt that appears in lessons throughout the site.

### /_layouts/

These are the templates or basic elements that control different catergories of pages on the site. Content is flowed into these categories. Changing these can change the look and feel of the entire site. We've highlighted the most relevant ones below.

* `widepage.html` is used throughout the site for many of the pages as a standard format.
* `lesson.html` is a template for the repeatable elements of the lesson page. This file controls the order and placement of the following elements:
    * Lesson page title
    * Rubric dimension row
    * Table of contents/lesson outline
    * De-risking Guide links
    * Airtable feedback form  
    
    Changing the order or content of the [includes](#_includes) in `lesson.html` will change these elements for every lesson page on the site.

### /collections/

There are four Jekyll collections ( `_admin`, `_courses`, `_pages`, `_rubric`)in this site that are housed in the `/collections/` folder. 

**Most of what you'll need to edit content on the site is housed here.**

 #### /collections/_admin/

This folder houses information about the course and the website itself.

 * `learningcohorts.md` is the rationale behind the learning cohort and the course.
 * `/howto/careandfeeding.md` is the document you're reading right now!

#### /collections/_courses/ 

The `/_courses/` folder has one subfolder for each course on the site (one - five). In each subfolder, you'll find an `overview.md` file which is the course overview page. This pages consist of a short description and a link to the lesson pages. 

#### /collections/_pages/

 The `/_pages/` folder holds other static pages on the site. The Agile practices overview (`agile.md`) is an example of a static page.

In this folder, `resources.md`, `rubric.md`, and `rubrictxt.md` all use [includes](#_includes) and YAML files from [data](#_data) to populate the list on the resources pags and the rubric rows.

#### /collections/_rubric/

The `/_rubric/` folder contains all of lesson pages on the site. 

**If you need to edit a lesson, you'd look for its markdown file in the `/_rubric/` folder.**

### /assets/

All images, audio, CSS, and Javascript for the site live here.


## LICENSE

Please see the LICENSE file in this repository for a full statement of the license for this material.

# Building, Maintaining, Publishing

Please see DEVELOPMENT at the root of this repository for build and test instructions.