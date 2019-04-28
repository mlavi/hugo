+++
date = "2015-08-17T21:09:12-07:00"
tags = ["database", "diagram", "code"]
title = "Database Change Management"

+++
Database configuration management tools allow us version the database and treat it like code!
We want DevOps, not mysterious, hidden, hand crafted DBA ops whenever possible. Another
flashback to 1998.
<!--more-->

### Self-taught DBA

In 1998, I was the co-founder of a start up named
[PassPoints](https://web.archive.org/web/20011218000620/http://www.passpoints.com/info/company_and_vision.shtml)
that provided private branded loyalty programs for web sites.

We were an **ASP** (Application Service Provider) and we had a web based API for integration.
Today, we use different terms to describe the same practices:
Software as a Service and REST API.

I was the *de-facto* system administrator and after talking to our developers, we chose
to build the application in Java with the Sun-Oracle-Netscape stack. So I became a self-
taught Oracle DBA (Data Base Administrator). I had some help from our developers who had
worked at Oracle, but I was pretty much on my own to digest the Oracle TechNet documentation
on CD-ROM and the web.

My progressive journey to infrastructure as code took me from two months to two hours to
deploy the Oracle 8 relational data base:

* two months to complete my first successful development database by hand
* two weeks to perfect and document the process for a demo instance database
* two days to create staging and start automating the process with shell scripts
* two hours to complete making a production database instance with my automation.

### Agile Databases
I may have gotten it faster, I don't remember now, but restoring data to a new instance
can be a lengthy procedure fraught with peril. **This is a critical reason to
make your database infrastructure agile and testable!**

Along the way, I looked for tools to help visualize the database and perform upgrades:
we paid for Oracle Enterprise Manager on Solaris and I found it helpful, but it was
not valuable to me.

#### Database Configuration Management

I had accomplished configuration management for a new database instance through shell scripts,
another artifact from the past! However, translating that accomplishment to using a configuration
management system like Chef or Puppet is not where the DBA Ops journey should end.

I recently rediscovered an open source tool I used back then to visualize and map the database:
http://schemaspy.sourceforge.net/ -- I think this would be a valuable post commit tool to add to
a build system for up to date, valuable documentation of your relational data.

We need to treat the data inside the database as critical infrastructure as well!
You cannot create an ephemeral test instance of your entire service with an empty persistence
tier, you need to populate your database(s) with a proper schema and bootstrap data before
you even begin testing.

#### Database Evolution

My last start-up was a polyglot development organization, which made QA and Operations
challenging permutations, but this is the way of the world. It made us increasingly
value automation because we did not want to scale people with manual work. One architectural
choice was the [Play 1 framework](https://en.wikipedia.org/wiki/Play_framework) for Java.
In their documentation, I never found mention that they had incorporated the
[Flyway open source project](http://flywaydb.org/getstarted/how.html), but when I came
across it on the web later, I already knew it intimately!

By using a simple meta-data table inside the database and ordered SQL statements
in your code repository, you can keep your databases under version control.
This is not practical for all of the data in your database, but it is essential for
maintaining your schema and core data that you need across all instances of your databases.

The highest of the ordered SQL statements that has been applied is stored in the meta-data table.
It is called the current evolution of the database. You application can roll out new or changed
functionality and require the database be evolved to the proper version before it turns on.

Another notable feature: you can declare how to reverse this change to a database in order
to devolve a database. There are destructive forward only operations, so this is not a
perfect safety net, but it is a good design goal. There are some best practices mentioned here:
https://code.google.com/p/dbdeploy/wiki/GuidelinesForUsingDbdeploy

#### Database Change Management Tools

I have found some other tools that roughly model the above methodology, but I only have
experience with Flyway, which I think is excellent!

- http://flywaydb.org/getstarted/how.html
- http://dbv.vizuina.com/ PHP based tool with change review
- https://code.google.com/p/dbdeploy/wiki/GettingStarted
- http://www.liquibase.org/quickstart.html XML based tool

### Dynamic Configuration

Knowing the release or version of your database is a component of dynamic configuration,
allowing you to design forward and backwards compatibility of APIs and features as well as
dynamic control of feature roll out. Let's use this for test driven operations, too!

I am sure that we borrowed another term for dynamic configuration at my last start-up.
We discussed feature toggles, shipping features dark, and later turning them on by
"lighting" them. Now there is an application start up **(ASP? :~)** for that
= http://launchdarkly.com/

### More to Muse Upon...

I will review these links later and update this blog entry:

- https://www.martinfowler.com/articles/evodb.html
- http://blog.codinghorror.com/get-your-database-under-version-control/
- http://www.infoq.com/articles/Database-Version-Control
- **Does not appear to be open source:** dbmaestro.com || klonio.com
- http://bluesoft.github.io/bee/
- http://www.brunton-spall.co.uk/post/2014/05/06/database-migrations-done-right/
