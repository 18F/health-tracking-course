---
layout: widepage
title: "Course One: Overview"
visibility: Hidden
---

# {{ page.title }}

In the first course, you will get a chance to engage with the highest priority elements of the project Health Tracker. The goal of this course is to build familiarity. When you are done, you'll have a holistic sense for how the Health Tracker, as a tool, is really just the *reporting* stage of a *process*. 

Subsequent courses will build your depth of knowledge regarding the practice of assessing software project management. When you are done with the first course, you'll be ready to begin applying the tracker with confidence, and tackle the material in the second course.



{% assign lessons_only = site.courses | where: "visibility", "Visible" | sort: "lesson" %}

## Lessons in Course One
<ol>
{% for p in lessons_only  %}
<li><a href="/{{ p.url | }}">{{ p.title }}</a></li>
{% endfor %}
</ol>