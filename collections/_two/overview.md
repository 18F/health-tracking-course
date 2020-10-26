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

# {{ page.title }}

In the second course, you will get a chance to engage with more elements of the project Health Tracker. The goal of this course is to begin building more depth of understanding around software projects and their successful management. 

{% assign lessons = site.two | where: "visible", true | sort: "lesson" %}

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
        <span style="background: {{ color }}; color: white; padding-left: 1em; padding-right: 1em;padding-top: 0.2em; padding-bottom: 0.2em; ">{% include indicator slug=p.indicator %}</span> 
    </td>
    <td> 
        
           <a href="{{ p.url | prepend: site.baseurl }}">{% if p.lesson > 0 %}Lesson {{ p.lesson }} - {% endif %}{{ p.title }}</a>
    </td>
</tr>
{% endfor %}
</table>