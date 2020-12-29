---
layout: wide
title: Rubric
---

<div style="width: 90%; margin: auto; margin-top: 2em; margin-bottom: 2em;">
{% for section in site.data.rubric %}
    {% comment %}
    Need to know, deep in the iteration, whether this is even or odd.
    CSS rules for even/oddness won't cut it.
    {% endcomment %}
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
    {% if forloop.first == true %}<h3>{{ priority.label }}</h3>{% endif %}
    {% comment %}
        {% if forloop.first == true %}<p class="priority">{{priority.label | strip | replace: " ", "<br>"}}</p>{% endif %}
        <p class="priority" >{%- include rubrictopagelink.html id=dimension.id -%}</p>
    {% endcomment %}
    <h4>Considerations</h4>
    <ul>
{% for tip in dimension.tips %}
    <li>{{ tip }}</li> 
{% endfor %}
    </ul>
    <h4>Status</h4>
    <ul>
        <li><b>Danger</b>: {{dimension.red}} </li>
        <li><b>Warning</b>: {{dimension.yellow}} </li>
        <li><b>Groovy</b>: {{dimension.green}} </li>
    </ul>
{% endfor %}
{% endfor %}
{% endfor %}
