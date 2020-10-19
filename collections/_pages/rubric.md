---
layout: wide
title: Rubric
permalink: /rubric/
---

<style>
.tiprow {
    margin-top: 1em;
    
}

.section:nth-of-type(odd) {
    background: #eaeaea;
}

.section:nth-of-type(even) {
    background: #fff;
}

.section {
    padding: 0.5em;
    color: black;
}

.tip {
    margin: 0.5em;
    padding: 0.9em;
    background: white;
    color: black;
    border-radius: 10px;
}

.blanktip {
    margin: 0.5em;
    padding: 0.9em;
    border-radius: 10px;
}

.green {
    margin: 0.5em;
    padding: .9em;
    background: #57F41C;
    color: black;
    font-size: 80%;
    border-radius: 10px;
}

.yellow {
    margin: 0.5em;
    padding: 0.9em;
    background: #FFDF00;
    color: black;
    font-size: 80%;
    border-radius: 10px;
}

.red {
    margin: 0.5em;
    padding: 0.9em;
    background: #F65235;
    color: black;
    font-size: 80%;
    border-radius: 10px;
}

.priority {
    float: left;
    margin: 1em;
    font-variant: small-caps;
    font-size: 120%;
    font-weight: bold;
    width: 50%;

}
</style>

<div style="width: 90%; margin: auto; margin-top: 2em; margin-bottom: 2em;">
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
                    {% if forloop.first == true %}<p class="priority">{{priority.level | replace: " ", "&nbsp;"}}</p>{% endif%}
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

<!--
<div style="width: 90%; margin: auto;">
    <div class="grid-row darkgrey">
        <h1 style="font-variant: small-caps;">Outcomes / Orientation</h1>
    </div>
    <div class="grid-row darkgrey">
        <div class="grid-col-3">
            <div class="grid-row">
                <div class="grid-col-12">
                    <h2>Are efforts clearly connected to intended outcomes and end users?</h2>
                </div>                
            </div>
            <div class="grid-row">
                <div class="grid-col-8 grid-offset-2">
                    <h3>Why this matters...</h3>
                    <p>
                        Outcomes-oriented Medicaid IT teams have a clear, program-driven direction. As a result, they more promptly identify and address issues that can impact progress and make smart tradeoffs in their day-to-day work.
                    </p>        
                </div>
            </div>
        </div>
        <div class="grid-col-9">
            <div class="grid-row">
                <div class="grid-col-2" >
                    <h3 class="priority">Top Priority</h3>
                </div>
                <div class="grid-col-10">
                    <div class="grid-row grid-gap">
                        <div class="grid-col-2 tip">
                            Ask to see the product roadmap and the overall roadmap.
                        </div>
                        <div class="grid-col-2 tip">
                            Ask how the state ensures services are accessible for all.
                        </div>
                        <div class="grid-col-2 red">
                            There is no roadmap for the product / service or enterprise.
                        </div>
                        <div class="grid-col-2 yellow">
                            There is a roadmap but it is unclear when value will be delivered, product or enterprise roadmaps conflict.
                        </div>
                        <div class="grid-col-2 green">
                            The roadmap captures how the product / service will evolve and demonstrates value to end users within 12 months, aligns with the enterprise roadmap.
                        </div>
                    </div>
                    <div class="grid-row grid-gap tiprow">
                        <div class="grid-col-3 tip">
                            Ask to see the product roadmap and the overall roadmap.
                        </div>
                        <div class="grid-col-1 blanktip"> &nbsp; </div>
                        <div class="grid-col-2 red">
                            There is no roadmap for the product / service or enterprise.
                        </div>
                        <div class="grid-col-2 yellow">
                            There is a roadmap but it is unclear when value will be delivered, product or enterprise roadmaps conflict.
                        </div>
                        <div class="grid-col-2 green">
                            The roadmap captures how the product / service will evolve and demonstrates value to end users within 12 months, aligns with the enterprise roadmap.
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </div>
</div>
-->