---
layout: widepage
title: Course Two Overview
course: 2
lesson: 0
indicator: admin
priority: high
visible: false
date: October 20, 2020
---

<style>
.courseslug {
    color: white; 
    padding-left: 1em; 
    padding-right: 1em;
    padding-top: 0.2em; 
    padding-bottom: 0.2em; 
}
</style>

# {{ page.title }}

{% assign lessons = site.rubric | where: "course", course | where: "visible", true | sort: "lesson" %}

## Lessons In This Course

<table class="usa-table--borderless">
<tr>
    <td><b>Health Indicator</b></td>
    <td><b>Lesson</b></td>
</tr>

{% for p in lessons %}
    {% if p.indicator == "admin" %}
        {% assign color = "#aaaaaa" %}
    {% else %}
        {% assign color="#1d3557" %}
    {% endif %}
<tr>
    <td>
        <span class="courseslug" style="background: {{ color }};">{% include indicator slug=p.indicator %}</span> 
    </td>
    <td> 
        
           <a href="{{ p.url | prepend: site.baseurl }}">{% if p.lesson > 0 %}Lesson {{ p.lesson }} - {% endif %}{{ p.title }}</a>
    </td>
</tr>
{% endfor %}
</table>


## What This Course Covers

In the second course, you will get a chance to engage with more elements of the project Health Tracker. The goal of this course is to begin building more depth of understanding around software projects and their successful management. 

{% for p in lessons %}
{% if p.overview %}
<h3>{% include indicator slug=p.indicator %}</h3>
<p>{{ p.overview }}</p>
{% include rubric dimension=p.dimension %}
{% endif %}
{% endfor %}

## Pause to Reflect

You have, presumably, completed the first course. This suggests you may be more confident than you were in the past, or perhaps you now know more, and are questioning prior assumptions. Regardless, please pause to reflect on where you are confident at this moment, and where you have concerns. This is anonymous, and it will help us as we shape the course and the conversations we have over the coming weeks.

{% include airtable-pre.html %}
