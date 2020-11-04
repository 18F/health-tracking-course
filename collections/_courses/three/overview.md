---
layout: widepage
title: Course Three Overview
course: 3
lesson: 0
indicator: admin
priority: high
visible: false
date: November 4, 2020
---

# {{ page.title }}

In this course sequence, the *simpler* things come *earlier*. Yes, they are high priority, but they tend to be easy to assess. As we work our way through the courses, things become more... nuanced.

{% assign lessons = site.rubric | where: "course", 3 | where: "visible", true | sort: "lesson" %}

## Lessons In This Course

<style>
.courseslug {
    color: white; 
    padding-left: 1em; 
    padding-right: 1em;
    padding-top: 0.2em; 
    padding-bottom: 0.2em; 
}
</style>

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

In the third course, we begin our exploration of the nuances of contracting and some of the more subtle aspects of thinking about software as an ongoing service obligation (as opposed to a one-and-done product purchase). 

{% for p in lessons %}
{% if p.overview %}
<h3>{% include indicator slug=p.indicator %}</h3>
<p>{{ p.overview }}</p>
{% include rubric dimension=p.dimension %}
{% endif %}
{% endfor %}
