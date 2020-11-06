---
layout: widepage
title: "Managing Data"
course: 3
lesson: 2
indicator: procurement
priority: high
visible: true
date: November 3, 2020
overview: |
    Data is big business. Many contractors have learned that if they build a system that "locks in" the government, they not only "own" the data (potentially tying the government to them as a vendor in-perpetuity), but the data itself becomes a valuable commodity to be resold on the open market. Neither of these outcomes (necessarily) serves the people.
dimension: pf2.1
---

# {{page.title}}

*This lesson explores a medium priority dimension of the Procurement Flexibility indicator.*

{% include rubric dimension=page.dimension %}

* TOC
{:toc}

## An Experiment in Data Access (20m, solo)

*This is an interactive lesson. Read, reflect, and **do** as you make your way through.*

You may be famliar with [Trello](https://trello.com/), a tool for organizing ideas into *lists* of *cards*. Often, Trello boards are private (that is, requiring a login), but some are public. Here's a public Trello board that demonstrates a bucket list.

[https://trello.com/b/WGQ0ZGKe/bucket-list](https://trello.com/b/WGQ0ZGKe/bucket-list)

Now, imagine that Trello is a case management system being used by a state to manage benefits for the people of your state. The lists and cards are no longer capturing the desire to start a blog, but instead holding critical PII and information about people who have real, life-critical needs. The software was developed by a vendor, for a state, and that vendor has failed time-and-again to develop robust, usable software that meets the needs of the people. The state would like to extract the data from the system, and work with a new vendor who is committed to demonstrating excellence as measured by this rubric and the Health Tracker. 

**How hard is it to extract the data from Trello?**

### The JSON View

It turns out that we can change the URL just a *tiny* bit, and get a "data-centric" view of the Trello board.

We removed the name of the board, and replaced it with `.json`. Try clicking this one.

[https://trello.com/b/WGQ0ZGKe.json](https://trello.com/b/WGQ0ZGKe.json)

YOU BROKE IT!

Just kidding. What you're looking at is JSON, or the JavaScript Object Notation format. It is probably not how an enterprise data system would export data, but it is a common interchange format for small amounts of data on the internet. Trello makes it possible to quickly and easily see the underlying data that is used to create a board.

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
 
## Data in your State (20m, solo)

In the section above, you were introduced to Trello, a web-based tool for organizing data into lists and cards. It is widely used by software and product management teams for organizing the work that takes place on software projects. We then wrote a short web application that 1) accesses a Trello board and 2) counts the cards in each of the lists, 3) presenting that data back to you, the end-user.

Now, think about the systems that your state is paying for year-over-year. In your notebook, ask (and answer) these questions:

1. Is the data in your state's systems easily accessible?
2. Is the data in your state's systems stored in industry-standard formats?
3. Is the data in yor state's systems stored using open-source software (e.g. MariaDB or PostgreSQL as a database vs. a product from Oracle)? 
4. Is the data in your state's systems stored in open, industry-standard formats?
5. Can the data be accessed using free and open tooling (e.g. free, open libraries written in a common programming language like Java, Python, Ruby, or C/C++), or is it only accessible via proprietary, closed-source tools (e.g. Salesforce)?
6. Is process by which data can be accessed and extracted from a vendor's systems well documented? 
7. Has that documentation been tested? That is, can someone employed by the state follow the instructions provided and  get a complete and correct dump of data in the system?
8. Is the integrity of the data tested as a regular part of software  testing?
9. Is it possible to dump the data and validate/verity the integrity of the archive that is extracted? 
10. Is the data format self-documenting? That is, once extracted, is it complex and opaque, or could a reasonably dedicated programmer study the data and understand what is going on?
11. Can the data be extracted with a single command? 

Once you have answered these questions (some of which might have the answer "I don't know"), take some time to think about other questions you think we should be asking. Our goal should be to have a long, working list of questions that we would be able to ask states and vendors as part of our ongoing oversight process. 

A state who has answers to all of these questions, and (in particular) can extract and validate an archive of all of their data in a single command, is in an excellent position to potentially reuse or otherwise migrate their data to new systems. A state whose data is "locked away" or otherwise completely opaque, from their point of view, is potentially locked in to a single vendor, and has no way to consider new vendors or systems without a lengthy, expensive, and possibly contentious process of first extracting their data from one vendor before moving to another.

## Additional Reading (30m, solo)

* [What Is Vendor Lock-In? | Vendor Lock-In and Cloud Computing
](https://www.cloudflare.com/learning/cloud/what-is-vendor-lock-in/)








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