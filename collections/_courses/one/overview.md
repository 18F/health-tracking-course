---
layout: widepage
title: Course One Overview
course: 1
lesson: 0
date: October 20, 2020
---

# {{ page.title }}

In the first course, you will get a chance to engage with the highest priority elements of the project Health Tracker. The goal of this course is to build familiarity. When you are done, you'll have a holistic sense for how the Health Tracker, as a tool, is really just the *reporting* stage of a *process*. 

Subsequent courses will build your depth of knowledge regarding the practice of assessing software project management. When you are done with the first course, you'll be ready to begin applying the tracker with confidence, and tackle the material in the second course.

{% assign lessons = site.rubric | where: "visible", true | where: "course", 1 | sort: "lesson" %}

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

<tr>
    <td><span class="courseslug" style="background: #aaaaaa;">Kickoff</span></td>
    <td><a href="{{ '/course/one/kickoff/' | prepend: site.baseurl }}">Kickoff</a></td>
</tr>

{% for p in lessons %}
    {% if p.indicator == "admin" %}
        {% assign color = "#aaaaaa" %}
    {% else %}
        {% assign color="#1d3557" %}
    {% endif %}
<tr>
    <td>
        <span class="courseslug" style="background: {{color}};">{% include indicator slug=p.indicator %}</span> 
    </td>
    <td> 
        
           <a href="{{ p.url | prepend: site.baseurl }}">{% if p.lesson > 0 %}Lesson {{ p.lesson }} - {% endif %}{{ p.title }}</a>
    </td>
</tr>
{% endfor %}
</table>