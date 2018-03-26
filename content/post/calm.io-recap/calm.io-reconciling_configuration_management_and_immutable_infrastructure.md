---
date: "2016-05-26T12:00:00-07:00"
tags: ['automation', 'DevOps', 'immutable', 'configuration management']
title: "Reconciling Configuration Management and Immutable Infrastructure"
draft: false
---
This [Calm.io blog recap](/post/calm.io-recap/)
 was originally written by me and posted on May 26, 2016 at
http://calm.io/2016/05/26/reconciling-configuration-management-and-immutable-infrastructure/
and slightly enhanced on February 18, 2018.
<!--more-->

As organizations move servers from the data center to the cloud, traditional
 approaches should grow to embrace a DevOps mindset for new capabilities,
 architectures, and values. Immutable Infrastructure represents an approach
 to simplify complexity and speed delivery of software to customers.
 Can inherently mutable configuration management tooling contribute to the
 immutable world of infrastructure artifacts?

"[Pets versus Cattle](http://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/)"
 is a strategic value we have discovered to increase the scale and agility of
 infrastructure and operations. Immutable infrastructure becomes an
 indispensable manner to achieve this vision.

# Long Lived Pets #

I characterized the traditional IT operator and system administrator value
 system which views change as risk to system and application availability
 and showed their progressive journey to DevOps in my Calm.io blog post
 [Configuration Management in the DevOps World](tbd).
 I generally use the terms server, resource, box, and node interchangeably.

When the primary measure of success is keeping servers up for years without
 down time, one can grow an emotional attachment to the system you built,
 named, and maintained over those years. It becomes natural to care for these
 systems, return them to health when they are sick, and to watch over them like
 proud parents as they grow through their life cycle. Hence the term *pets*
 describes the care and feeding of these systems and when performed by hand,
 it becomes a sizable resource investment. These investments were required
 when resources were scarce and long-lived, but these traditions do not apply
 for ephemeral populations.

From an abstract viewpoint, it seems ridiculous to have a bond to a machine
 and to treat it with love and care like a pet. I see organizations who merely
 virtualize their pets when they migrate to the cloud; they continue to
 practice manual operations to maintain their pets. One symptom of this problem
 is continuing the disaster recovery practice of maintaining an inventory of
 entire static disk image backups. While they have taken the first step towards
 agile infrastructure by embracing virtualization in the public or private
 cloud, they have stopped short of taking the next step.

One cannot scale efforts beyond a small, hand maintained population of pets
 without embracing automation.

# Configuration Management = Mutable Infrastructure #

Per the [Internet meme](https://memegenerator.net/X-All-The-Things),
 we want to automate all the things!

I quote from my blog post on [Configuration Management in the DevOps World](tbd):

"Configuration Management represents the next step after provisioning
 a nascent infrastructure resource to install and configure it to perform
 a certain role, such as a web server, database, etc."

Having automated the creation of a system role, one can synthesize new peers
 from scratch. However, is it easy to carry forward traditional practices still
 that convey pet status on our resources under configuration management.

Traditional applications maintain local state in memory and storage on these
 resources, *e.g.:* application and system configuration values such as
 credentials and passwords, customer session tables and transactions,
 system and application logs and metrics are stored locally.
 Exempting ephemeral information, the system state becomes increasingly
 valuable with every local write operation and correspondingly,
 increasing mutation to the system state! This poses a quandary:
 what happens if we lose the resource, how do we preserve the valuable,
 mutable local state? This will be addressed in the section
 [The Journey to Immutability](#the-journey-to-immutability).

Regularly scheduled configuration management runs serves as a means of
 enforcement to insure that our systems do not drift: they work to return
 everything to a prescribed state. Over time, configuration management runs
 might also introduce further changes to operate on the state of the system,
 e.g.: update a configuration value, install an operating system security patch,
 or another life cycle maintenance operation (restart an application, etc.).
 While configuration management represents a huge step forward for automation,
 all life cycle operations and events conducted via configuration management
 support the maintenance of long lived servers, and thus they represent a
 regression back to *pet* values.

# A Herd of Cattle #

Harnessing automated infrastructure provisioning via configuration management
 and other methods makes it easy to create any quantity of servers, nearly as
 trivial as a single instance! Automated infrastructure requires a new approach
 to operations at scale: resource management. Algorithmic naming conventions are
 needed for each resource, e.g.:

 * webserver__1__,
 * webserver__2__,
 * webserver__3__,
 * … webserver__*N*__

 represents a simple naming convention for a population of __*N*__
 web servers. This represents a break with pet resources and a transition to a
 fleet of resources. To compliment the popular *pets* analogy, now the fleet can
 be viewed as a herd of cattle and many livestock or fleet methods and analogies
 abstractly apply.

A failing resource should not be treated as a *pet*: it does not need to be
 cared for and returned to health! Borrowing from cluster management,
 the approach is *[STONITH](https://en.wikipedia.org/wiki/STONITH)*
 = "shoot the other node in the head" by taking it out of service
 and remediate the loss with a new replacement. Of course, a failing resource
 can be quarantined for troubleshooting, forensics, restoral, and remediation,
 but this represents a significant manual effort. Automated remediation efforts
 are needed at scale because *pet operations* can not scale due to their
 by hand, manual, one-off nature.

Automated infrastructure provisioning supports maintaining a dynamic population.
 By scaling up and scaling down the population based upon demand, the population
 consumes resources economically. I.e. an elastic population represents cost
 savings by eliminating unused resources compared to a maximum capacity planned,
 static population.

# The Journey to Immutability #

To paraphrase Wiktionary:
 *[immutable](https://en.wiktionary.org/wiki/immutable)* =
 unable to be changed; a constant.

We need to reconcile the tendency to treat each of our cattle as a pet with
 valuable local state and a longer life cycle. The solution is to refactor
 from mutable to immutable infrastructure; this encompasses DevOps values
 via strategies which implicate new methods and tools for creating and
 consuming infrastructure on a shorter life cycle. The immutable infrastructure
 strategies are:
 [read only](#read-only),
 [dynamic configuration](#dynamic-configuration),
 and [infrastructure artifacts](#infrastructure-artifacts).

## Read Only ##

Treating a resource’s local storage as read only makes the file system
 immutable and forces us to evaluate everything in a new light!
 The primary issue boils down to the question: how do I preserve local state?

For temporary state, the best answer is to use memory whenever possible
 (which is fast, but is a finite resource and must be maintained),
 otherwise it falls into the following category. For the remaining local state
 needs, migrate them to remote services via the network,
 *i.e.* ship them off box to a centralized facility for persistence.
 Treat everything as a remote data store and pick the appropriate facility!

* System and application logs and metrics should be delivered to centralized facilities;
    *this will be the topic of a future blog post.*
* Temporary sessions and transactions could be shared across the
 fleet of resources, such as in a fast NoSQL database.
* See [dynamic configuration](#dynamic-configuration) strategy for
 system and application configuration.

Read only implies that system and application state can not be updated and
 this will be addressed with the next two strategies:
 (dynamic configuration) and (infrastructure artifacts).
 Consider the advantages of read only file system: by design,
 it cannot be directly tampered with and it removes a raft of security issues!
 Another advantage is that read only removes most of the resource life cycle
 operations.

## Dynamic Configuration ##

For the lack of a better term, I collect a number of concerns under the
 umbrella of dynamic configuration.

The initial system and application configuration state must be read from a
remote source, even if it is ultimately communicated via local memory such as
by environment variables:

  * Systems and applications can be adjusted to accommodate configuration
  parameter updates, making them dynamic.
  * Feature flags or feature "lighting" can signal activation, switching, or
  deactivation of code execution paths to change application functionality
  without infrastructure redeployment;
  *this will be the topic of a future blog post.*

The population of resources needs an inventory to accommodate service discovery
and scheduling:

  * An index allows life cycle management
  (e.g.: auto scaling tools).
  * An index allows references between members of the population
  (e.g.: load balancing, multi-tiered applications).

Dynamic configuration represents an evolving area, there are many solutions
and most are part of cluster scheduling and configuration management systems;
*this will be the topic of a future blog post.*

## Infrastructure Artifacts ##

If configuration management necessarily represents mutable infrastructure,
 how can it work for immutable infrastructure? This is a concern that I have
 pondered for years and it represents the struggle to unlearn traditional
 values and embrace infrastructure as code on the journey to DevOps.
 Using configuration management to build, not operate, infrastructure is the
 solution.

Configuration management runs after a node is provisioned and it "builds"
 the system into a desired role with static configuration as a run time
 operation, mutating the filesystem. One concern can be addressed by
 refactoring static to dynamic configuration to remove a state dependency.
 The next step is to never use configuration management again after the initial
 system build for life cycle operations. The resulting filesystem is treated
 as an infrastructure artifact by exporting it. To recap: we can refactor
 configuration management to move from an ongoing run time operation to
 synthesize mutable infrastructure to a one time build operation producing
 an immutable infrastructure artifact.

Mounting the infrastructure artifact file system as read only and relying on
 dynamic configuration yields immutable infrastructure! Building immutable
 infrastructure artifacts should be automated and tied to revision control
 and software build systems. By eliminating the barrier between application
 and infrastructure, operators have joined developers in creating buildable
 and testable infrastructure, which should be tied to
 [application integration testing](tbd).
 Now the application *IS* the infrastructure!

Immutable infrastructure yields an amazing breakthrough: infrastructure reuse!
 No longer does one need to provision a different, localized type of
 infrastructure for each scenario development, testing, staging, and production:
 they can and should all be the same build artifact, differing only by dynamic
 configuration management. By reducing the delta between any environment from
 development to production, risk is minimized.
