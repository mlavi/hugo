---
date: "2015-11-03T12:00:00-07:00"
tags: ['automation', 'DevOps', 'Infrastructure as Code', 'Blueprint']
title: "Infrastructure as Code and Calm Blueprints"
draft: false
---
This [Calm.io blog recap](/post/calm.io-recap/)
 was originally written by me and posted on Nov 3, 2015 at
http://calm.io/2015/11/03/infrastructure-as-code-and-calm-blueprints/
and slightly enhanced on February 18, 2018.
<!--more-->

In our continuing journey to DevOps,
 [let us revisit our definition](/post/calm.io-recap/calm.io-i-dream-of-devops-but-what-is-devops/)
 in context of infrastructure:

> DevOps is the __*process*__ of reducing friction between the developer
 and customer value.

We are in a transition from hand maintained physical infrastructure to
 modeling virtual infrastructure as software. This process can be expressed
 in many ways, but it is often referred to as __*Infrastructure as Code*__
 and it is a fundamental component in the practice of
 __*Immutable Infrastructure,*__
 which I will cover in a future blog entry.
 Infrastructure as Code democratizes access to infrastructure,
 achieving the dream of on-demand, cloud experience of agile infrastructure
 (and accomplishing [Patrick Dubois' original motivation](https://groups.google.com/forum/#!topic/agile-system-administration/HKCTSee2u4w)
 for creating DevOps)!

# A Redistribution of Infrastructure #

Infrastructure is the bedrock of our applications: it hosts our software
 and infrastructure has been the traditional realm of operations
 to the exclusion of the rest of the engineering organization.

With the advent of commodity virtualization and the rise of the cloud computing,
 we have compute power offered as a utility in public and private data centers.
 This is a huge contrast to the physical time shared, dedicated, and costly
 capital expenditure compute systems that require dedicated operations teams
 to maintain as mainframe, cluster, and server farms concerned with secure
 access, power, networking, cooling, and storage at scale. Today, we see a
 redistribution of dedicated infrastructure in nearly every organization to
 on-demand, elastic compute capacity on premises as a private cloud or over
 the Internet to public clouds. In addition, commodity virtualization and
 containerization enables full stack environment development on a developer
 laptop. The lines between infrastructure and application development have
 been erased forever: today, a developer can build infrastructure artifacts
 and version control environments.

This redistribution is a signal and a call for Infrastructure as Code
 and the DevOps process: the friction caused by physical infrastructure
 is being removed as infrastructure becomes increasingly abstract.

# Traditional Infrastructure is Dead, Long Live Ephemera Ephemeral Infrastructure! #

As provisioning compute capacity becomes a simple exercise of a virtualization
 or cloud Application Programmer Interface (API), we are transitioning away
 from hand maintained systems that were the exclusive domain of the operations
 staff. Traditionally, these systems are backed up, restored, and migrated
 with an inventory of storage snapshots and have a critical health metric of
 up-time measured in years.

The infrastructure industry worked to provide automated backups and monitoring
 to support operations staff, but the result was further dependency on
 maintaining binary images containing state, insulation from the creation
 process, and increasing operations specialization to support these maintenance
 systems. Operating system vendors tackled the provisioning problem, but their
 solutions were also specialized and isolated the efforts of operations teams
 into tribes.

Traditional infrastructure practices are often repeated in the cloud and they
 represent a lateral translation of skills and tools. However, there is little
 to no justification for preserving the values of bespoke, hand crafted, isolated
 systems because we have a new set of capabilities which enable agile
 infrastructure and can replace traditional approaches to maintenance.

There were inroads on infrastructure codification and they had limited success.
 The first level of infrastructure codification was the manual operation
 run book: a document of procedures to be performed by the operations staff
 by hand. The second level of codification built on run books by scripting
 at least a portion of the procedures, but often they were hard coded,
 literal historical representations of the work performed and required
 manual interpretation and translation in order to repeat the procedures
 using proprietary vendor tools. While this approach does represent code,
 it did not scale and suffered problems of little to no testing,
 dependency checking, and/or transactional roll backs. Furthermore, efforts
 were compromised by minimal audit logs, wrappers around vendor tools,
 and a lack of governance and accessibility unless you were a system admin
 or reliability engineer. The results were a small improvement
 compared to complete life cycle provisioning APIs.

We discuss many pitfalls of hand scripted work in our whitepaper:
 Calm IT Down, DevOps in the Container Era.

# Ephemeral Infrastructure: Automate Everything #

Using provisioning APIs, one can synthesize virtual infrastructure,
 throw it away, and re-instantiate it again in just minutes or seconds:
 this rapid life cycle allows us to test small changes to infrastructure
 in isolation and on demand, paving the way to continuous integration
 of Infrastructure as Code.

One way to characterize the virtual infrastructure life cycle is that
 it approximates the standard software methods of Create, Read, Update,
 Delete (CRUD). Provisioning APIs are an important key for new
 infrastructure models, uniting the operations tribes (storage, OS,
 networking, etc.) again to solve application wide operations instead
 of working from the bottom up on each of the infrastructure pieces in isolation.

Even the longest lived data persistence tier is transitioning to this
 infrastructure model, enabling discussions of data gravity, portability,
 and mutable life cycles rather than a the key metric of permanence.
 The age of our systems is declining while the population is increasing:
 we have entered into an era of ephemeral everything!

Collecting all of our operations into API calls allows us to codify the
 order of those operations, i.e.: exercise these APIs with this configuration
 and you will get a new virtual infrastructure resource ready to be used by
 your application.

# Full Stack Configuration Management #

This brings us to the next problem: we have an entire stack of software
 which resides on each piece of our infrastructure:

* Operating system, drivers, tools, and configuration
  * *e.g.:* Red Hat Enterprise Linux, Debian, Ubuntu, CentOS, Windows Server
* Language runtimes, tooling, libraries, and configuration
  * *e.g.:* Ruby, Java, PHP, PERL, Python, JavaScript, etc.
* Server facility packages and configuration
  * *e.g.:* Apache, Nginx, IIS web server
* Health packages and configuration
  * *e.g.:* centralized logging, monitors, metrics
* Finally, our organization’s application artifacts and configuration
  * *e.g.:* our e-commerce store, registration system, databases, etc.

How does one codify the infrastructure and the full stack that resides on it?

We see the traditional first and second order solutions and their problems
 (described above) again: hand crafted run books then shell scripts.
 But another tooling industry has arisen over the past decade to address
 how to configure an individual virtual resource: Configuration Management.
 Fortunately, all of the configuration management work results in code and
 this will be the topic of another future blog entry!

Combining provisioning APIs and configuration management into code that
 anyone can share and execute removes the barriers to mastering all of the
 infrastructure pieces and this is the promise of infrastructure as code!
 The operations, testing, and development teams can collaborate on
 infrastructure as code, version control their work, automate testing
 of their code, revert their work in case of error, and ultimately
 improve the automation of the infrastructure of their applications.
 This is one of the ways to achieve DevOps today!

We see a a constant stream of innovative new set of tools and platforms
 entering into the DevOps ecosystem built on top of these APIs,
 but mastering them represents a new set of challenges before you can
 recognize the limits of their benefits. I have already discussed the pitfalls,
 please see [Why is-DevOps-So-Hard?](/post/calm.io-recap/calm.io-why-is-devops-so-hard/)
 for more on this topic.

This is the DevOps way: we have removed the barriers and friction to
 infrastructure by expressing it as code in a transparent and democratic manner,
 allowing our infrastructure to be consumable by anyone in engineering.
 Now we can design and engineer for the applications which reside on the
 infrastructure and resolve the question of who is responsible for your
 application and the infrastructure it resides upon? The answer is everyone:
 we are all DevOps!

# Ephemeral Applications: Orchestrate Everything #

However, truly agile infrastructure requires more than individual resource
 automation: it requires orchestration of all of the resources into an
 application architecture. In other words, can we coordinate all of the
 pieces of the infrastructure and compose them into a whole application?

# Calm Blueprint example #

IMG: Three tier application blueprint

For example, the back end persistence tier of databases, authentication,
 and health systems need to exist before our application tier services
 can connect to them and come up. The application services need to be healthy
 before they can be rolled into the application load balancer for
 high availability of the application tier. Once the application load balancer
 has achieved some minimal threshold of service health, then the web servers
 can connect and they can inform the web caching tier,
 which can confirm health and be rolled into the web load balancer.

The cascading set of dependencies from the back to the front of our
 application architecture is the logical next stage of Infrastructure as Code!

Orchestration is a challenge that Calm solves by integrating clouds,
 configuration management, operations, and more via our agentless
 approach to managing resources in a Calm blueprint. By default,
 Calm will begin to provision every resource in parallel,
 but it will not complete deployment tasks until dependencies are met.

Calm supports role based authorization to blueprints. Because Calm deals
 with public and private clouds, containers, and bare metal machines,
 integrates different configuration management tools,
 and allows agentless access to anything else, all of these provisioning tasks
 have full auditability! This allows the delegation of application
 provisioning to anyone, allowing self-service, *ad-hoc* testing for the
 entire, integrated application architecture across many resources and tiers.
 But why should we stop there?

# Operations as Code: Automate Everything #

## Orchestration of Operations ##

IMG: Orchestration of Operations

Now that we can address the entire application as a whole entity inside
 a Calm blueprint, we can codify, orchestrate, audit, and delegate operations
 as well. I like to call this Operations as Code, and examples include:

* delegating pulling logs from an entire tier of new application servers
 without having to get the SSH key and then log into each resource
* simple remediation of the application state when a specific health monitor
 is tripped
* upgrading the application in place with the latest build artifacts
* reference architectures with operational best practices as blueprints
 for other teams to share, improve, and consume.

Each of these operations can be invoked by a RESTful API call into Calm,
 allowing you to incorporate full stack, full application integration testing
 into your continuous integration builds and tests.
 With Calm, engineering organizations can finally test the latest
 developer changes on a fully integrated application on the fly.
 This lowers the barrier to continuous delivery entirely,
 achieving another win for the DevOps process!

# Business Operations: Govern Everything #

By conquering deployment, orchestration, operations, and audits,
 Calm blueprints enable full application life cycle management
 and unite the DevOps ecosystem with all of people who consume applications.
 The next dimension of the Calm blueprint are the business policies
 such as budgets, application expiration, notifications, and approvals.
 Business policy examples include:

* Allow only the QA teams to deploy this blueprint to the public cloud
 with a monthly budget of $X.
* Every QA team application deployment in the public cloud
 should expire after 72 hours, but get approval from the team first.
* Every time an upgrade operation is made in production,
 get an approval from the VP of Engineering first.
* When an upgrade operation completes in production, notify Sales,
 Marketing, and Customer Support to alert the waiting customer
 for the feature or fix.

By integrating all of the DevOps tooling, platforms, and clouds
 with people and business rules, Calm allows the management of
 applications and DevOps.

# Conclusion #

Infrastructure as Code is an essential accomplishment for enabling the
 DevOps goal to remove all friction between the developer and customer value.
 It is enabled by a redistribution of physical hand maintained infrastructure
 into the virtual and cloud platforms with APIs augmented with configuration
 management, allowing the delegation and collaboration for infrastructure
 provisioning.

The full promise of Infrastructure as Code is delivered when extended
 to orchestrate and operate the whole application life cycle and this
 becomes the basis for business operations to govern the applications
 and the DevOps ecosystem.
