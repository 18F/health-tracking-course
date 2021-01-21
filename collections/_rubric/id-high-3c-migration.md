---
layout: lesson
title: "Data: Migration"
dimension: 
   - id1.3
   - id1.3-course3b
overview: |
    Security in applications for federal agencies is absolutely critical; our work is held in the public's trust, and it is up to us, and our vendors, to make sure that trust is not broken. Likewise, having migration strategies and practices in place means that we know how an application will grow, change, and accommodate the needs of users over time---another kind of security, in short.
federal:
    - devops
    - buildorbuy
    - techbudget
    - contracttype
state:
    - limitspending
    - limitcontracts
    - expandpool
    - operationalexpense
    - asktechnical
---


In this lesson, we're going to talk about how pieces of data get organized into systems that can be searched and organized: databases. We'll start here to understand just WHAT we're testing when we talk about security, performance, and migration testing&mdash;since it's usually DATABASES.
# The Question

Now, my question is this: what happens when you want to **change the database**?

A change in the database is a kind of *migration*. That is, if we change a database table (by adding or removing a column), that means that we need to update all of the records in the *current* database, and all future data written to the database must take this into account.

Doing this on a live system is difficult. It is *especially* difficult if the developers failed to account for this reality from the beginning. However, a good development team will have tools in place to support data migrations in an automated manner, and ongoing improvements and changes to the system should not cause any (substantial) difficulty. 

# Migrations: Three Kinds

For now, we'll claim there are three kinds of data migration. This is not, by any means, an exhaustive characterization. The names for these migrations are not "terms of art," but should help you think about what is involved in changing and moving data in a system.

1. **Incremental**. Incremental migrations happen when the system is grown as part of its normal, ongoing development. For example, if the system was built with the notion of a first/middle/last name, and it is being updated to include a more inclusive (and therefore accurate) notion of names, this would be an incremental migration within the system.
2. **Geographic**. "Geographic" migrations happen when the data is moved, wholesale, from "Point A" to "Point B." For example, perhaps the state is moving the data from servers they own and manage into "the cloud." Or, perhaps they are changing the cloud provider for their database infrastructure.
3. **Legacy**. Legacy migrations happen when a system is being moved from a 30-year-old, proprietary/bespoke technology to a modern, open database solution. These are sometimes part of a massive system rewrite. However, done correctly, they can be incremental and be completed alongside a living, legacy system.

We'll dwell on the incremental and the geographic migrations, as legacy systems migrations are a whole set of topics unto themselves. 

## Migrations: Incremental

The example from the previous lesson regarded names; let's build on that here. 

A database might store names as three fields: **first**, **middle**, and **last**. It might be that we want to represent names more humanely. Each of the following names would "present a challenge" for a system that *expects* a first, middle, and last name.

1. Simon
2. Darth Vader
3. Gordon Matthew Thomas Sumner
4. Pablo Diego José Francisco de Paula Juan Nepomuceno María de los Remedios Cipriano de la Santísima Trinidad Ruiz y Picasso

The first is an example of someone who has only one name. The second is someone without a middle name (and they get *really* angry when they have to fill in a middle name. Yes, they use Skywalker, but they often end up crushing the mouse in rage.) The third example is the artist more commonly known as Sting. The last is the artist you might best know as "Pablo Picasso."

### Incremental Migration: Multiple Steps

It might be that a proposal is put forward to make changes in more than one step. That is, the system is live, and working, and significant changes could be problematic. The first step might be to change the way data is entered by caseworkers. This could involve *capturing* the full, proper name, but not *yet* integrating it.

In the database, we would then have four fields: first, middle, last, and **full name**.

Now, these might be entered as follows:

| **first** | **middle** | **last** | **full** |
| Simon | N/A | N/A |  Simon |
| Darth | N/A | Vader |  | Darth Vader |
| Gordon | Matthew Thomas | Sumner | Gordon Matthew Thomas Sumner |
| Pablo | N/A | Picasso | Pablo Diego José Francisco de Paula Juan Nepomuceno María de los Remedios Cipriano de la Santísima Trinidad Ruiz y Picasso |

This step has the problem that it involves the caseworker entering data twice; this introduces the possibility of a name being entered correctly in one place, and incorrectly in another. We could do things like check that the **first** name appears in the **full** name (which would help), but it would be a potentially fraught step. (This detail is mentioned to help you imagine why migrations are complex. Good developers will work with users, have tests in place, and plan a series of changes that yield better software over the course of the incremental changes.)

A second step might be to integrate this new information in the system as a whole. For example, if there is a search interface, that might be modified to use this new **full** name field. That way, if someone comes in and says their name is "Pablo Diego Picasso," the system will use that information to search the first, middle, and last name fields... but *also* search the full name field. This improves the quality of search in the system, but still does not fix the challenge of dealing with first/middle/last names.

The next step might be to modify the case management system so it does not *rely* on any of these fields. That is, it might *only* expect a first name, but the notion of "expect" here is that it is then used for presentation. If everywhere in the system is designed so that there *must* be a **full** name field, and there *should* be a **first** name field, and everything else is *optional*, then we're ready for the final big change.

In the last change, the system would be modified so that the only *required* field was the **full** name field. The first, middle, and last name fields would all bec ome optional. In this way, we would properly record people's names, and for search/presentation purposes, we might have a first name (to keep things short), but all questions of whether someone does or does not have a middle or last name goes away.

### Incremental Migration: Testing and Rollback

This series of changes might take weeks to months, depending on how large and complex the system is. With each change, not only does the software have to change, but the database has to change as well. Good development teams will develop tests that show the system is working well *as-is*, and they will develop tests for how the system should work *when they update*. They will have a tool that transforms the original database to a newer database, and have tests in place that confirm the changes happened.

All of these tests should allow the software team to have the live (production) system, the new system under test (staging), and the ability to syncronize/test both at the same time. Depending on the size and complexity of the system, they should then be able to move to a {% include link id="bluegreen" text="blue/green configuration" %}. This means they have two versions of the system side-by-side. If the switch to the new version doesn't work for some reason, it is possible to point things back to the original version and figure out what went wrong.

### Incremental Migration: In Summary

**This is a lot of detail, yet it still glosses over a great deal.** The important thing to remember here is that an incremental migration isn't necessarily small or simple. However, it does mean that the system is always available, and always improving. You, as the State Officer, M.D., should be on the lookout for situations where a state or vendor is claiming a system will need to be offline for several days, or that a change will take more funds, or months, or any number of things that suggest that the data and system are not being tested and managed in a way that allow for incremental change. (More questions of this sort will come at the end of this lesson.)

## Migration: Geographic

A geographic migration involves moving data between data centers or cloud providers. It is, essentially, a huge "file copy" of the data from one system to another.

For example. *A story*. (Get some popcorn.)

The state might be using systems that were built by Avendor. Avendor has seen a lot of growth lately, and are starting to offer more services and products. They're trying to talk the state into using their new in-house system, but you and the state hold firm: you want the data to be on open systems, on systems owned/paid for by the state, but accessed/managed by the vendor. It's hard, but Avendor would rather hold on to the contract than lose the state as a customer, and after months of back-and-forth, they agree. 

No doubt, there's lots more process involved here; this story is not about the acquisitions process, or security and ATO, or any number of other things that should/could be considered at this point. This story is *only* about the data migration. So, skipping a bunch of things, the state decides to look into three cloud providers:

* FutureSee-er
* Minicushy
* Nile

All three of these vendors are reasonably well known in their space, and offer various kinds of services, whether it is fully managed database systems, or virtual machines that the vendor and state can use to build databases on. Note that the assumption we're making is that the state will "own" the machines and databases, not the vendor. There is more to be said here (and were it oh so simple in reality), but for simplicity, we're going to pretend that the data is not living on systems wholly owned and managed by the vendor. Instead, we're going to pretend that this kind of migration is a moment where the state can begin to "gain control" or "keep control" of **their** data.

If the databases underlying the system are standard/open source, then all three cloud providers will work. If the vendor has built their systems using proprietary technologies (for example, FutureSee-er has custom extensions to otherwise common database systems that are a kind of "lock-in"), then this might be a moment where the state asks the vendor to first to an incremental migration from a proprietary database system to a free-and-open database system. Then, the second step would be to migrate the content from the free-and-open system owned/managed by the vendor to the same system owned/managed by the state.

Once these two systems are up-and-running, we have a {% include link id="bluegreen" text="classic blue/green configuration" %}. With minimal (or eve zero) downtime, the vendor should be able to flip their system from using their internal systems to the cloud-provided databases now owned by the state.

This kind of migration is, in some ways, simpler than an incremental migration. The reason is that the structure of the data does not change. As a result, making sure that tests are carried out for correctness (always), security, performance (because we're now running the database in a new place, on new systems), and new failure modes (all such changes introduce new networking concerns, for example) are necessary, but the system should continue to "just work" when the switch is thrown from the old database to the new. "Should," of course, assumes a lot of good testing and engineering, but it's doable.
 
# Questions Regarding Migration

There's a lot of detail in database migrations. Here, we looked at incremental and geographic migrations.

The questions we might ask of states about these kinds of changes can get... specific. However, we're now talking about the data that upholds a complex system. And if those systems (and the care and feeding of the data in those systems) are not designed and implemented well, the implications are that the taxpayer will suffer when changes are made and upgrades need to happen. Or worse, the system will so difficult to upgrade that we will be locked in with aging technology and have no clear path forward. 

This is where we are often find ourselves today. Many systems are bound up in proprietary, aging mainframe systems that are extremely difficult to upgrade and maintain. The questions here scratch the surface of what should be being considered to develop software and systems that are robust in the face of aging and change.

Because these questions are getting specific, we will include a *why* with each. This may help you better understand the context for the question and why it matters. (And, to better contextualize the answers that you receive.)

1. **Is the data stored in an open database, or a proprietary database?**
   <br>WHY: If the database is free/open software (e.g. PostgreSQL, MariaDB, MongoDB, etc.), it is less likely the state can be locked into a single set of tools in the long run. If the database is closed/proprietary/vendor-specific, then migration becomes more difficult.
2. **Are the tools for interacting with the data open, or closed and proprietary?**
   <br>WHY: If vendor-specific tools are required for working with the database, then those tools could be removed/made obsolete over time. If the tools are open, then even if they age, it will always be possible to update/analyze/understand what those tools were doing/were used for. (For example, I have documents written using open formats from the 1990's that still work. People who used Word 95 to write documents can, in some cases, no longer open those files... because the tools for working with those documents are closed/proprietary. The open tools last longer.)
3. **Is the database vendor-specific, or vendor-neutral?**
   <br>WHY: Some database technologies today are vendor-specific. Cloud providers are producing "flavors" of databases that have features unique to them. Or, they change the way you can dump/access the data, so that you are *notionally* using a free product, but actually having to go through their proprietary gateways in order to access your data. Vendor-neutral databases can easily be migrated cloud-to-cloud, while vendor-specific databases might *appear* to be open, but really are another form of lock-in.
4. **Does the vendor have a migration plan?**
   <br>WHY: From the beginning, there should be a plan for how the data might be migrated from one system to another. If this is not designed in from the beginning, then it will be much harder to "graft" onto the system later.
5. **Does the vendor practice automated migration?**
   <br>WHY: Is the vendor using automated tools to maintain and upgrade their database from one version of the software to the next? For example, if a database needs to be changed or updated, is it handled through automated means, or does someone have to do things "by hand?" If it is automated, it means that it can be done repeatably (and reliably), and it can be automatically tested before and after. If it is done by hand, it means that somewhere in the world there is **just one person** who knows how to handle the migration. Or, there *might* be a team... but, more likely, it's just one person. This is very, very bad. Migrations should be automated and testable, always, and should be designed/built into the system from the beginning.
6. **Does the vendor automate tests of migrations?**
   <br>WHY: Version 7 of a database contains data; version 8 has new fields and tables inserted, and therefore modifies the data in version 7. Does the vendor have automated tests in place that will <span style="color: red; font-weight: bold;">fail</span> when run against a version 7 database, but <span style="color: green; font-weight: bold;">succeed</span> when run against a version 8 database? Are these kinds of pre/post migration tests in place for every revision of the software? Do these tests get run every time a bug is fixed in a prior version of the software?
7. **Can a migration be "rolled back" instantaneously and reliably?**
   <br>WHY: If a migration/upgrade is executed, and something breaks, is it possible to "just press a button" and go back to the previous version? Or, better, is there a staging process where the production (or live) environment remains untouched, such that there is no interruption of service if the "new" version breaks for an unforseen reason?
8. **Can the state do a version upgrade with confidence**?
   <br>WHY: Does the state trust the backups, testing, and migration process such that there is no actual concern to doing a database update/migration? For modern, cloud-based systems, it is considered commonplace to ship updates/changes to *living products* multiple times per day. Therefore, if the state considers database updates to be dangerous or special, it probably means that the vendor does not have good backup and testing strategies in place.
9. **Is the system backed up and/or preserved with every migration?**
   <br>WHY: If something goes *catastrophically* wrong, there should never be any question that the data and system still exist. Backups should automatically be made (and their integrity tested) as part of all update/migration processes. Today, it is more likely that systems will have a staging/test/production lifecycle whereby the "live" system is never updated until it is proved out on several other systems (the staging/test systems). Regardless, there should be a "snapshot," or some kind of backup, that is made as a routine part of these processes always.

# Discuss in Community (1h, group)

1.  **Check in**. {% include countdowntimer minutes=5 %} First, check in with each-other. How is everyone doing? Take a moment to share something positive from the week, either at work or at home.
2.  **Understand**. {% include countdowntimer minutes=20 %} Next, take some time to discuss points where you were confused or questioned your material. You might make a point of leveraging your small-group conversation here, and focusing your questions on things related to the projects you are responsible for.
3.  **Reflecting**. {% include countdowntimer minutes=20 %} Data, and the complexity it represents, may be one of the defining challenges of our lives. What data is your state (and, therefore, possibly the vendors) collecting? How is it being used? Do the states (or the US government) have access to the data it paid for? Or, are we in the position of re-buying the data we already paid to collect. Is that data managed responsibly? How would you know? Are we held hostage to legacy data systems? If not, what strategies are in place to move to future-proofed, open information systems that can grow and change with need? These are just a handful of questions that might serve to start your conversation as a group. 
4.  **Transformation**. {% include countdowntimer minutes=10 %} One hour is not enough time to tackle the issues of data in large-scale health IT systems. However, you should be thinking concretely about what changes you can look for in your state's systems to guarantee that the people of the United States are not being bamboozled when it comes to their health data, and that access to benefits and much needed resource is not hampered by poorly designed and delivered IT systems. What steps can you take/are you taking to move things forward? Perhaps a small group can meet, discuss, and begin tackling this challenge systematically over time, and enact change over the next year.
