---
layout: widepage
title: "Data: Migration"
dimension: id1.3
overview: |
    Security in applications for federal agencies is absolutely critical; our work is held in the public's trust, and it is up to us, and our vendors, to make sure that trust is not broken. Likewise, having migration strategies and practices in place means that we know how an application will grow, change, and accommodate the needs of users over time---another kind of security, in short.
---

# {{ page.title }}

*This dimension of iterative development involves multiple notions of "security," with specific focuses on data and testing. We've broken this up into multiple lessons.

{% include rubric dimension="id1.3" %}

### Roadmap

We've introduced the notion of bits and bytes in the previous lesson. In this lesson, we're going to talk about how those pieces of data get organized into systems that can be searched and organized: databases.

{% include breadcrumbs seq="Bits and Bytes,Databases,Migration,Testing" highlight="Migration" %}

# Migration

Let's check in.

1. You've thought about bits, bytes, and the *size* of data.
2. You've read and thought about the way data is organized in databases. In short, databases look like a bunch of spreadsheets.

Now, my question is this: what happens when you want to **change the database**?

{% include breadcrumbs seq="Bits and Bytes,Databases,Migration,Testing" highlight="Migration" %}

A change in the database is a kind of *migration*. That is, if we change a database table (by adding or removing a column), that means that we need to update all of the records in the *current* database, and all future data written to the database must take this into account.

Doing this on a live system is difficult. It is *especially* difficult if the developers failed to account for this reality from the beginning. However, a good development team will have tools in place to support data migrations in an automated manner, and ongoing improvements and changes to the system should not cause any (substantial) difficulty. 

# Questions Regarding Migration

These questions start to get... specific. However, we're now talking about the data that upholds a complex system. And, if those systems (and the care and feeding of the data in those systems) are not designed and implemented well, the implications are that the taxpayer will suffer when changes are made and upgrades need to happen. Or, worse... the system will so difficult to upgrade, that we will be locked in with aging technology, and have no clear path forward. 

This is, of course, where we are today. Many systems are bound up in proprietary, aging mainframe systems that are extremely difficult to upgrade and maintain. The questions here scratch the surface of what should be being considered to develop software and systems that are robust in the face of aging and change.

Because these questions are getting specific, we will include a *why* with each. This may help you better understand the context for the question, and why it matters. (And, to better contextualize the answers that you receive.)

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

 