---
date: "2018-02-18T12:00:00-07:00"
tags: ['automation', 'DevOps', 'calm.io']
title: "Calm.io: a blog series recap!"
draft: false
---
From September 23, 2015 to May 26, 2016,
 I took hiatus from my personal blog to explore, explain, and write a number
 of DevOps articles for my employer on the
 [Calm.io blog](http://calm.io/author/mark). Nutanix acquired Calm.io and I
 am still part of the Nutanix Calm team, but I'm re-posting these articles on
 my personal blog since the originals are no longer directly accessible.
 I am also enhancing them to clarify language, add learnings,
 and append significant developments as postscripts.
<!--more-->

# Original, but Slightly Enhanced Articles #

Listed by publishing date, these articles are a progressive journey to DevOps.
I've moved the final paragraphs out from most of the articles to the
 [Calm.io Calls to Action](#calm-io-calls-to-action) section as well as
slightly enhancing each article in February, 2018:

* September 23, 2015:
 [I Dream of DevOps, but What is DevOps?](/post/calm.io-recap/calm.io-i-dream-of-devops-but-what-is-devops/)
  * [Original URL](http://calm.io/2015/09/23/i-dream-of-devops-but-what-is-devops/)
  and call to action: [Calm and DevOps](#calm-and-devops)
  * Postscript February 18, 2018: [DevOps Definition](/post/calm.io-recap/calm.io-i-dream-of-devops-but-what-is-devops/#postscript-february-18-2018-devops-definition)
* October 20, 2015:
 [Why is DevOps So Hard?](/post/calm.io-recap/calm.io-why-is-devops-so-hard/)
  * [Original URL](http://calm.io/2015/10/20/why-is-devops-so-hard/)
  and call to action: [Calm is the DevOps Solution](#calm-is-the-devops-solution)
  * Postscript February 27, 2018: [Pets versus Cattle](/post/calm.io-recap/calm.io-why-is-devops-so-hard/#postscript-february-27-2018-pets-versus-cattle)
* November 3, 2015:
 [Infrastructure as Code and Calm Blueprints](/post/calm.io-recap/calm.io-infrastructure-as-code-and-calm-blueprints/)
  * [Original URL](http://calm.io/2015/11/03/infrastructure-as-code-and-calm-blueprints/)
   and call to action:
   Calm blueprints represent the full potential of Infrastructure as Code, please contact us for a demonstration of Calm today!
* December 28, 2015:
 [Demystifying Continuous Integration, Delivery, and Deployment](/post/calm.io-recap/calm.io-demystifying-continuous-integration-delivery-and-deployment/)
  * [Original URL](http://calm.io/2015/12/28/demystifying-continuous-integration-delivery-and-deployment/)
  and call to action:
  [The Role of Calm in Continuous Delivery and Deployment](#the-role-of-calm-in-continuous-delivery-and-deployment)
  * Postscript 2018-04-13: [Netscape Tinderbox](/post/calm.io-recap/calm.io-demystifying-continuous-integration-delivery-and-deployment/#postscript-2018-04-13-netscape-tinderbox)
* May 24, 2016:
 [Configuration Management in the DevOps World](/post/calm.io-recap/calm.io-configuration-management-in-the-devops-world/)
  * [Original URL](http://calm.io/2016/05/24/configuration-management-in-the-devops-world/)
  and call to action: [Calm and Configuration Management](#calm-and-configuration-management)
* May 26, 2016:
 [Reconciling Configuration Management and Immutable Infrastructure](/post/calm.io-recap/calm.io-reconciling_configuration_management_and_immutable_infrastructure)
  * [Original URL](http://calm.io/2016/05/26/reconciling-configuration-management-and-immutable-infrastructure/)
  and call to action: [Calm and Immutable Infrastructure](#calm-and-immutable-infrastructure)

# Calm.io Calls to Action: #

## Calm and DevOps ##

At Calm, we have collected many of the problems customers face and we describe our solution in our white paper: Calm IT Down: DevOps Automation for the Container Era.

At Calm, we believe in enhancing the DevOps ecosystem by integrating the tools, clouds, and platforms you have adopted, accelerating the value you get out of them by modeling your entire architecture, and then driving orchestration, operations, access, budget, and policy on top of your models for all the people, partners, and systems in your organization. Please read our white paper and request a demo!

## Calm is the DevOps Solution ##

Calm is a DevOps automation platform, built for the container era, but born in the bare metal data center. Calm can leverage your existing choices for cloud, platforms, and tools allowing you to integrate and automate them.

The heart of Calm is your full stack/environment application’s blueprint,
 it represents Infrastructure as Code, [please see the next blog entry
 for more detail](/post/calm.io-recap/calm.io-infrastructure-as-code-and-calm-blueprints/).
 We extend the blueprint past infrastructure to describe your resource
 dependencies (for orchestration, see image below), application policies
 (for access controls, budgets, notifications, and approvals),
 and operations (scale up/down nodes, upgrades, gather logs, etc.),
 which I like to call Operations as Code.

*IMG: Calm Blueprint example, Example three tier application Calm blueprint*

Behind the scenes, Calm blueprints are JSON created with a simple, beautiful web interface to allow DevOps engineers to design and end users to consume your application’s architecture and operations. I will talk about how to remix clouds and configuration management systems with hybrid architectures and Operations as Code in later blog posts.

With role based access control on blueprints, Calm allows ephemeral application deployments, delegated access to any person, team, or system for deployments and operations, along with auditability. Now we can get every person, tool, cloud, and platform on to the same page via Calm blueprints! This is the manner to apply DevOps values onto the DevOps ecosystem in place at your organization for today and for tomorrow.

If you haven’t already taken the opportunity, I invite you to read our first white paper and request a demo!

## The Role of Calm in Continuous Delivery and Deployment ##

As I have blogged before, Calm blueprints model your entire application and encapsulate Infrastructure as Code and Operations as Code for your application’s deployment and life cycle management. Calm blueprints allow delegation to deploy and manage the application life cycle to any team for *ad hoc* work or for other systems for DevOps automation to achieve continuous delivery and deployment.

Calm compliments your existing software development pipelines for continuous integration, delivery, and deployment. Application integration testing for continuous delivery can be achieved with Calm:

> A build system can invoke a Calm blueprint via our REST API to deploy an application with the latest build artifacts, perform application integration tests as operations, and then have Calm de-provision the application instance,
accomplishing ephemeral application integration testing environments.

> The same outcome could be driven from inside a Calm blueprint, allowing you to model the entire application life cycle from build to test to deployment: invoke the build system, pull and deploy the latest artifacts, and then perform application integration test operations.

Either approach works with Calm due to the flexibility in our automation platform. Repeating continuous delivery with a Calm blueprint to production achieves continuous deployment.

Because Calm blueprints model your applications and operations, Calm can integrate your clouds, tools, platforms, and people as well as the way you wish to achieve continuous delivery and deployment. Calm blueprints add audits, notifications, and approvals as needed in addition to allowing reuse of the deployment and test operations on all of your application instances!

Let us show you how to deliver continuous value: please read our white paper and request a demo!

## Calm and Configuration Management ##

With Calm’s visual approach to Infrastructure as Code, you can model your applications across different configuration management systems within the a blueprint. The model based approach allows teams to experiment with different configuration management systems at the same time, enabling refactoring, migration, testing, and collaboration: you can on-board new teams or organizations using different configuration management systems with ease.

Furthermore, Calm can handle application service orchestration for deployment and operations as an integral whole across hybrid data centers, clouds, and containers. By describing the logical dependencies of the services in an application blueprint, Calm can automatically figure out the quickest way to provision in parallel while satisfying deployment dependencies. With Calm orchestration, no longer will you find a missing server behind a load balancer or an application that cannot connect to a database. Calm can accommodate complex operations across the entire application, such as an upgrade, might require several stages of orchestration across different application service tiers, for instance:

* remove an application server from a load balancer
* stop the application server or change to maintenance mode
* insure drained incoming and outgoing connections
* download artifacts, patch the operating system, etc. to perform the upgrade
* restart or restore the application server to production mode
* test the application server and outgoing connections
* restore the application server to the load balancer.

Orchestration can easily outstrip configuration management system abilities and Calm goes further to provide choices to roll out of a change to a fleet of cattle and enables coordination across the entire application state. Please ask for a demo today!

With Calm, you can refactor between configuration management
and immutable infrastructure with any approach to operate your applications
today and tomorrow, let us show you how!

## Calm and Immutable Infrastructure ##

Calm helps your organization tackle infrastructure migration from synthesized
 at runtime and mutable to built infrastructure artifacts and immutable
 architecture to realize all of the strategic
 advantages of these methods. When tools, systems, and applications embrace
 DevOps values, infrastructure as code can progress to immutable
 infrastructure as code.

Deployment of immutable infrastructure is faster than using configuration
 management during provisioning run time.
 [We have blogged previously](http://www.calm.io/2016/06/09/building-a-cicd-pipeline-with-docker-and-calm-part-2/)
 on how it becomes simpler to upgrade or revert deployments behind a
 load balancer with immutable infrastructure, which also enables multiple
 deployment strategies including partial (mixed "canary")
 and atomic ("blue/green" or "red/black") roll outs.

Calm enables refactoring workloads __from Pets to Cattle__,
 *i.e.* from bare metal to VM (and to containers) across different providers
 at the same time. This allows you to float above different clouds
 and enable global load balancing or migration with Calm.

Calm supports build systems to deploy your infrastructure artifacts as part of
 [application integration testing](/post/calm.io-recap/calm.io-demystifying-continuous-integration-delivery-and-deployment/),
 which accomplishes infrastructure and deployment testing!
 The Calm blueprint contains static and dynamic
 infrastructure application state, which should be used to drive dynamic
 configuration of your applications.

There are so many ways Calm delivers DevOps agility for your applications
 today and for your new needs tomorrow, please request a demo today!
