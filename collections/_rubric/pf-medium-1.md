---
layout: lesson
title: "Managing Data"
dimension: pf2.1
overview: |
    Data is big business. Many contractors have learned that if they build a system that "locks in" the government, they not only "own" the data (potentially tying the government to them as a vendor in-perpetuity), but the data itself becomes a valuable commodity to be resold on the open market. Neither of these outcomes (necessarily) serves the people.
---

## An Experiment in Data Access (40m, solo)

**Timer**: {% include countdowntimer minutes=20 %} 

*This is an interactive lesson. Read, reflect, and **do** as you make your way through.*

You may be famliar with [Trello](https://trello.com/), a tool for organizing ideas into *lists* of *cards*. Often, Trello boards are private (that is, requiring a login), but some are public. Here's a public Trello board that demonstrates a bucket list.

[https://trello.com/b/WGQ0ZGKe/bucket-list](https://trello.com/b/WGQ0ZGKe/bucket-list)

Now, imagine that Trello is a case management system being used by a state to manage benefits for the people of your state. The lists and cards are no longer capturing the desire to start a blog, but instead holding critical PII and information about people who have real, life-critical needs. The software was developed by a vendor, for a state, and that vendor has failed time-and-again to develop robust, usable software that meets the needs of the people. The state would like to extract the data from the system, and work with a new vendor who is committed to demonstrating excellence as measured by this rubric and the Health Tracker. 

**How hard is it to extract the data from Trello?**

### The JSON View

It turns out that we can change the URL just a *tiny* bit, and get a "data-centric" view of the Trello board.

We removed the name of the board, and replaced it with `.json`. Try clicking this one.

[https://trello.com/b/WGQ0ZGKe.json](https://trello.com/b/WGQ0ZGKe.json)

**YOU BROKE IT!**

Just kidding. What you're looking at is JSON, or the JavaScript Object Notation format. It is probably not how a MES system would export data, but it is a common interchange format for small amounts of data on the internet. Trello makes it possible to quickly and easily see the underlying data that is used to create a board.

This also means that we can write code that interacts with that data.

### Listing the Lists

Given the JSON format, it is possible to 1) fetch it, 2) manipulate it, and 3) do stuff with it. We wrote a small demonstration app as part of this tutorial to show you how this works.

<!-- Code at bottom of page. -->
<div class="grid-container">
    <div class="grid-row">
        <div class="grid-col-6">
            <label class="usa-label" for="with-hint-input">
                Trello URL
            </label>
            <span class="usa-hint">
                Paste a Trello URL in the text field below.
            </span>
            <input class="usa-input" id="trello-url" width="100%" value="https://trello.com/b/WGQ0ZGKe/bucket-list">
        </div>
    </div>
    <div class="grid-row" style="margin-top: 2em;">
        <div class="grid-col-6 grid-offset-4" >
            <button class="usa-button" onclick="showLists();">Show Board Lists</button>
        </div>
    </div>
    <div class="grid-row" style="margin-top: 2em;">
        <div class="grid-col-8">
            <table class="usa-table usa-table--borderless" width="100%" id="trello-table">
                <tr>
                    <th scope="col">List</th>
                    <th scope="col"># of Cards</th>
                </tr>
            </table>
        </div>
    </div>
</div>

You can use the "bucket list" board as an example, but you should also try looking at some other [public Trello boards](https://maybevaibhav.medium.com/best-35-trello-boards-for-you-to-see-and-get-inspired-6bf28b565616) to find out what kind of results you get.

### How Did We Do That?

As "web applications" go, this was relatively straight-forward.

1. You gave us a URL to a Trello board.
2. We manipulated that URL, removing some parts, and adding a ".json" to the end.
3. We asked your browser to fetch that URL.
4. The results came back as JSON, which is easily manipulated in Javascript.
5. We looked into the JSON to find the names of all of the lists.
6. We used that information to count how many cards were in each list.
7. Using Javascript, we rebuilt part of the webpage to show you what we discovered.

There is no testing, minimal validation, and really, you should be unsurprised if it fails. It's a demo that we put together to make an educational point, not robust enterprise software intended for consumption by millions of people.

### Why Did We Do That?

This all ways to demonstrate one critical point:

**Data in a Trello board is not "locked away" in a proprietary, vendor-controlled database**. 

Let's break that down a bit further, though. What is true about the data stored in Trello?

1. **Easily Accessible**. The data stored in a Trello board can be accessed simply by changing a URL.
2. **Standard Formats**. The data in a Trello board is stored in an industry-standard format.
3. **Simple Extraction API**. The data in a Trello board can be extracted with a simple HTTP-based API (Application Programmer Interface) request.
4. **Open, Standard Tooling**. The languages and tools required to access and manipulate the data are free and open. Further, they are exceedingly common. (In this case, Javascript. We could have also used Python, Java, C, C++... really, *any* programming language.)
5. **Well Documented**. To do this, we used documentation that was easily found on the internet. Most of the documentation needed was actually [standard docs for Javascript](https://developer.mozilla.org/en-US/docs/Web) provided by Mozilla. In other words, we were checking our knowledge of Javascript, not any special features of Trello.
6. **Self-Documenting**. The data extracted from Trello was *self-documenting*. That means we could look at the data, and it was immediately apparent what that data represented. No additional documentation or questions to the vendor (in this case, Atlassian) were necessary.
7. **One-Click Extraction**. It is essentially possible to extract data from Trello with a "single click." We could easily write a script that, given a collection of Trello boards, could extract (and store, backup, migrate, or otherwise manipulate) all of the data in all of the boards.
 
## Data in your State (40m, solo)

**Timer**: {% include countdowntimer minutes=30 %} 

In the section above, you were introduced to Trello, a web-based tool for organizing data into lists and cards. It is widely used by software and product management teams for organizing the work that takes place on software projects. We then wrote a short web application that 1) accesses a Trello board and 2) counts the cards in each of the lists, 3) presenting that data back to you, the end-user.

Now, think about the systems that your state is paying for year-over-year. In your notebook, ask (and answer) these questions:

1. Is the data in your state's systems easily accessible?
2. Is the data in your state's systems stored using open-source software (e.g. MariaDB or PostgreSQL as a database vs. a product from Oracle)? 
3. Is the data in your state's systems stored in open, industry-standard formats? Which ones?
4. Can the data be accessed using free and open tooling (e.g. free, open libraries written in a common programming language like Java, Python, Ruby, or C/C++), or is it only accessible via proprietary, closed-source tools (e.g. Salesforce)?
5. Is process by which data can be accessed and extracted from a vendor's systems well documented? 
6. Has that documentation been tested? That is, can someone employed by the state follow the instructions provided and get a complete and correct dump of data in the system?
8. Is the integrity of the data tested as a regular part of software testing?
9. Is it possible to get the data outof the system and validate/verity the integrity of the archive that is extracted? 
10. Is the data format self-documenting? That is, once extracted, is it complex and opaque, or could a reasonably dedicated programmer study the data and understand what is going on?
11. Can the data be extracted with a single command? 

Once you have answered these questions (some of which might have the answer "I don't know"), take some time to think about other questions you think we should be asking. Our goal should be to have a long, working list of questions that we would be able to ask states and vendors as part of our ongoing oversight process. 

A state who has answers to all of these questions, and (in particular) can extract and validate an archive of all of their data in a single command, is in an excellent position to potentially reuse or otherwise migrate their data to new systems. A state whose data is "locked away" or unreachable to them is potentially locked in to a single vendor and has no way to consider new vendors or systems without a lengthy, expensive, and possibly contentious process of first extracting their data from one vendor before moving to another.

{% comment%}
<!-- The previous lesson spills into this one, so we remove the shared experience prompt. -->
{% include shared-experience-prompt.html %}
{% endcomment%}
## Vendor Lock-In (1h, group)

Come together with your colleagues for a conversation.

{% include rubric dimension="pf2.1" %}

Google offers a service called *takeout*. If you have a Google account, you can go to [https://takeout.google.com/](https://takeout.google.com/) and download *all* of your data in a single click. You can get a compressed file containing all of your emails. You can get a single download of all of the data you have in Drive. You can download a zip of all of your photos. In short, you can take all of your data and leave Google's services.

We suspect that states cannot move their data from one system to another nearly so easily.

In your group conversation, you fundamentally have two questions to explore:

1. Is your state's data locked in to a single vendor? If so, how?
2. What steps can you take, as state officers, to help your states break free?

For #2 and #3, below, you'll want someone to take notes. Whomever has a birthday closest to Veteran's Day (after, not before) is encouraged to step up.

1.  **Check in**. {% include countdowntimer minutes=5 %} First, check in with each-other. How is everyone doing? Take a moment to share something positive from the week, either at work or at home.
2.  **Catalog**. {% include countdowntimer minutes=10 %} The first question asked above asks us how data might be "locked away" from a state. As a group, catalog the ways you see your states' health data locked away from them. In the event that you feel a state is *not* "locked in," share that, and why. Your goal is to come up with a catalog of the ways you see your states constrained (or not) by their vendors.
3.  **Deconstruct**.  {% include countdowntimer minutes=25 %} Once you have a catalog, start working through it. As a group, think about the second question posed above: how could you, given where you sit, help states "break free?" What would be the ideal situation for states when it comes to their health data? How can you help them get there?
4. **Reflect and Vote**.  {% include countdowntimer minutes=5 %} Take a pause from your conversation, and let the notetaker reflect back what you've said so far. Assuming you have multiple strategies, each of you should pick *two* that you think are of potential interest to explore further. Spend your **+1**s, and after voting, see which two ideas have the most votes. 

At your next full team meeting, the note taker should share out a brief summary of your conversation, and highlight the two ideas/strategies for "freeing" state data with the rest of the group. Our hope is that this will be the beginning of a conversational space for potential work amongst the larger group to shift data management/ownership practices.




<script>
    function onResponse (request) {
        return function () {
            const resp = request.response;
            console.log(resp);
            if (resp) {
                // Delete old rows
                for (row of document.getElementsByClassName("DELETEME")) {
                    row.remove();
                }
                // Grab the table itself, so new rows can be inserted.
                var table = document.getElementById("trello-table");
                // Lets take a look at the lists in the console.
                console.log(resp.lists);
                // For each element of lists array...
                for (e of resp.lists) {
                    // Grab the list ID, and count how many times it shows
                    // up in the list of cards.
                    listid = e.id;
                    cardcount = 0;
                    for (c of resp.cards) {
                        if (c.idList == listid) cardcount++;
                    }
                    // Create the new rows, and populate it with data.
                    newr = document.createElement("tr");
                    // Make sure to set the class appropriately, 
                    // so we can delete it later. 
                    newr.setAttribute("class", "DELETEME");
                    ln = document.createElement("td");
                    ln.textContent = e.name;
                    lc = document.createElement("td");
                    lc.textContent = cardcount;
                    newr.appendChild(ln);
                    newr.appendChild(lc);
                    // Append the new row to the table.
                    table.appendChild(newr);
                }
            }
        }
    }
    function showLists() {
        console.log("beep.");
        var url = document.getElementById("trello-url").value;
        console.log(url);
        // https://trello.com/b/WGQ0ZGKe/bucket-list
        let re = /^https:\/\/trello.com\/b\/(.*?)\/.*$/
        let groups = re.exec(url);
        // Make sure it is a trello URL.
        if (groups) {
            //Rewrite the URL. 
            // https://trello.com/b/WGQ0ZGKe.json
            let newURL = "https://trello.com/b/" + groups[1] + ".json";
            let request = new XMLHttpRequest();
            request.responseType = 'json';
            request.open('GET', newURL);
            request.onload = onResponse(request);
            request.send();
        } else {
            console.log("url is not a match.");
        }
        // Prevent the default behavior.
        return false;
    }
</script>




[](https://www.lifewire.com/what-is-google-takeout-4173795)
