---
layout: widepage
title: "Course One"
indicator: admin
visible: false
---

# {{ page.title }}

In the first course, you will get a chance to engage with the highest priority elements of the project Health Tracker. The goal of this course is to build familiarity. When you are done, you'll have a holistic sense for how the Health Tracker, as a tool, is really just the *reporting* stage of a *process*. 

Subsequent courses will build your depth of knowledge regarding the practice of assessing software project management. When you are done with the first course, you'll be ready to begin applying the tracker with confidence, and tackle the material in the second course.

{{ site.collections.one }}

{% assign lessons = site.one | where: "visible", true | sort: "lesson" %}

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
        <a href="{{ p.url | prepend: site.baseurl }}">{{ p.title }}</a>
    </td>
</tr>
{% endfor %}
</table>