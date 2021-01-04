---
layout: wide
title: Rubric
permalink: /rubric/
---

<div style="width: 90%; margin: auto; margin-top: 2em; margin-bottom: 2em;">
    <em>We also have a <a href="{{ '/rubrictxt' | prepend: site.baseurl }}">plain text</a> version of this rubric.</em>
</div>

<div class="sr-only">
{% include rubric-txt.html %}
</div>

<script>
    let root = document.documentElement;

    contrast = "low";
    function flipColors() {
        if (contrast == "low") {
            contrast = "high";
            console.log("Setting " + contrast + " colors.");
            root.style.setProperty('--danger-color', '#601A4A');
            root.style.setProperty('--warning-color', '#EE442F');
            root.style.setProperty('--ok-color', '#63ACBE');
            document.getElementById("contrast").innerHTML = "low";
        } else {
            contrast = "low";
            console.log("Setting " + contrast + " colors.");
            root.style.setProperty('--danger-color', '#F65235');
            root.style.setProperty('--warning-color', '#FFDF00');
            root.style.setProperty('--ok-color', '#57F41C');
            document.getElementById("contrast").innerHTML = "high";
        }
    }

</script>

<div aria-hidden="true">
<a href="#" onclick="flipColors();">Use <span id="contrast">high</span>-contrast colors.</a>
{% include rubric-div.html %}
</div>
