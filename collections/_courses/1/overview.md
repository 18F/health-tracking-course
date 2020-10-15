---
layout: widepage
title: "Course One: Overview"
course: 1
lesson: 0
visibility: Hidden
---

# {{ page.title }}

In the first course, you will get a chance to engage with the highest priority elements of the project Health Tracker. The goal of this course is to build familiarity. When you are done, you'll have a holistic sense for how the Health Tracker, as a tool, is really just the *reporting* stage of a *process*. 

Subsequent courses will build your depth of knowledge regarding the practice of assessing software project management. When you are done with the first course, you'll be ready to begin applying the tracker with confidence, and tackle the material in the second course.


{% assign lessons_only = site.courses | where: "visibility", "Visible" | where: "course", 1 | sort: "lesson" %}

## Lessons in {{ page.title }}

<table class="usa-table--borderless">
{% for p in lessons_only  %}
<tr>
    <td>
        <span style="background: #1d3557; color: white; padding-left: 1em; padding-right: 1em;padding-top: 0.2em; padding-bottom: 0.2em; "> {{ p.indicator }} </span> 
    </td>
    <td> 
        <a href="{{ p.url | prepend: site.baseurl }}">{{ p.title }}</a>
    </td>
</tr>
{% endfor %}
</table>