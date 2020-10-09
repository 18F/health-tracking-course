---
layout: wide
title: Rubric
---

<style>
.tiprow {
    margin-top: 1em;
    
}
.darkgrey {
    padding: 0.5em;
    background: #ccc;
    color: black;
}

.tip {
    margin: 0.5em;
    padding: 0.2em;
    background: white;
    color: black;
    border-radius: 10px;
}

.blanktip {
    margin: 0.5em;
    padding: 0.2em;
    border-radius: 10px;
}

.green {
    margin: 0.5em;
    padding: 0.2em;
    background: #238823;
    color: black;
    font-size: 80%;
    border-radius: 10px;
}

.yellow {
    margin: 0.5em;
    padding: 0.2em;
    background: #FFBF00;
    color: black;
    font-size: 80%;
    border-radius: 10px;
}

.red {
    margin: 0.5em;
    padding: 0.2em;
    background: #D2222D;
    color: white;
    font-size: 80%;
    border-radius: 10px;
}

.priority {
    float: right;
    margin: 1em;
    font-variant: small-caps;
    font-size: 120%;
    font-weight: bold;

}
</style>

<div style="width: 90%; margin: auto; margin-top: 2em; margin-bottom: 2em;">
{% for section in site.data.rubric %}
    <div class="grid-row darkgrey">
        <h1 style="font-variant: small-caps;">{{section.header}}</h1>
    </div>
    <div class="grid-row darkgrey">
        <div class="grid-col-3">
            <div class="grid-row">
                <div class="grid-col-12">
                    <h2>{{section.question}}</h2>
                </div>
            </div>
            <div class="grid-row">
                <div class="grid-col-8 grid-offset-2">
                    <h3>Why this matters...</h3>
                    <p>
                        {{section.wtm}}
                    </p>        
                </div>
            </div>
        </div>
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
                        <div class="{% if dimension.tips.size == 1%}grid-col-3{% else %}grid-col-2{% endif %} tip">
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
                    </div>
                </div>
{% endfor %}
{% endfor %}
                </div> <!-- end priority group -->
{% endfor %}
    </div>
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