---
layout: wide
title: Rubric
permalink: /rubric/
---

<div style="width: 90%; margin: auto; margin-top: 2em; margin-bottom: 2em;">
    <em>We also have a <a href="{{ '/rubrictxt' | prepend: site.baseurl }}">plain text</a> version of this rubric.</em>
</div>

<!-- This is the "text layout" version of the rubric. It should only be visible to screen readers. -->
<div style="width: 90%; margin: auto; margin-top: 2em; margin-bottom: 2em;" class="sr-only">
{% for section in site.data.rubric %}
    {% assign mod = forloop.index | modulo: 2 %}
        <h1>{{section.header}}</h1>
        <b>{{section.question}}</b>
        <hr noshade>
        <div class="usa-summary-box" role="complementary">
            <div class="usa-summary-box__body">
                <h2 class="usa-summary-box__heading">
                    Why this matters...
                </h2>
                <div class="usa-summary-box__text">
                    {{section.wtm}}
                </div>
            </div>
        </div>
{% for priority in section.priorities %}
{% for dimension in priority.dimensions %}
    <div class="grid-row"> 
    {% if forloop.first == true %}<h3>{{ priority.label }}</h3>{% endif %}
    </div>
    <div class="grid-row">
        <div class="grid-col-8 grid-offset-1">
        {% for tip in dimension.tips %}
            <h4>{{ tip }}</h4> 
        {% endfor %}
            <ul>
                <li><b class="danger-text">Bad</b>: {{dimension.red}} </li>
                <li><b class="warning-text">Meh</b>: {{dimension.yellow}} </li>
                <li><b class="ok-text">Good</b>: {{dimension.green}} </li>
            </ul>
            Lessons: {%- include rubrictopagelink.html id=dimension.id sep=", "-%}
            {% unless forloop.last %}<hr noshade width="20%">{% endunless %}
        </div>
    </div>
{% endfor %}
{% endfor %}
{% endfor %}
</div>

<!-- This is the "print layout" version of the rubric. It should be hidden to screen readers. -->
<div style="width: 90%; margin: auto; margin-top: 2em; margin-bottom: 2em;" aria-hidden="true">
{% for section in site.data.rubric %}
    {% comment %}
    Need to know, deep in the iteration, whether this is even or odd.
    CSS rules for even/oddness won't cut it.
    {% endcomment %}
    {% assign mod = forloop.index | modulo: 2 %}
    <div class="grid-row section">
        <div class="grid-col-3">
            <div class="grid-row">
                <div class="grid-col-12">
                    <h1 style="font-variant: small-caps; padding-left: 1.5em;">{{section.header}}</h1>
                    <h2 style="padding-left: 2em; width: 90%;">{{section.question}}</h2>
                </div> <!-- question --> 
            </div> <!-- row -->
            <div class="grid-row">
                <div class="grid-col-8 grid-offset-2">
                    <h3>Why this matters...</h3>
                    <p>
                        {{section.wtm}}
                    </p>        
                </div> <!-- wtm -->
            </div> <!-- row --> 
        </div> <!-- col-3 -->
        <div class="grid-col-9">
{% for priority in section.priorities %}
            <div class="grid-row">
{% for dimension in priority.dimensions %}
                <div class="grid-col-2" style="display: inline-block; vertical-align: top;">
                    {% if forloop.first == true %}<p class="priority">{{priority.label | strip | replace: " ", "<br>"}}</p>{% endif %}
                    <p class="priority" >{%- include rubrictopagelink.html id=dimension.id sep=",<br>"-%}</p>
                </div>
                <div class="grid-col-10">
                    {% if forloop.first == true %}<hr>{% endif %}
                    <div class="grid-row grid-gap tiprow">
{% for tip in dimension.tips %}
                        <div class="{% if dimension.tips.size == 1%}grid-col-3{% else %}grid-col-2{% endif %} tip" {% if mod == 0 %}style="background: #eaeaea;"{% endif %} >
                            {{tip}} 
                        </div>
                        {% if dimension.tips.size == 1%}
                        <div class="grid-col-1 blanktip"> &nbsp; </div>
                        {% endif %}
{% endfor %}
                        <div class="grid-col-2 red">
                        {{dimension.red}}
                        </div>
                        <div class="grid-col-2 yellow">
                        {{dimension.yellow}}
                        </div>
                        <div class="grid-col-2 green">
                        {{dimension.green}}
                        </div>
                    </div> <!-- row --> 
                </div> <!-- col-10 -->
{% endfor %}
        </div> <!-- row priority group -->
{% endfor %}
        </div> <!-- col-9 -->
    </div> <!-- row darkgrey -->
{% endfor %}
</div>

<br> &nbsp; <br>
