---
date: "2016-05-24T12:00:00-07:00"
tags: ['automation', 'DevOps', 'Configuration Management']
title: "Configuration Management in the DevOps World"
draft: false
---
This [Calm.io blog recap](/post/calm.io-recap/)
 was originally written by me, posted on May 24, 2016 at
http://calm.io/2016/05/24/configuration-management-in-the-devops-world/,
and slightly enhanced on February 18, 2018.
<!--more-->

Configuration Management is a category of tool which is an essential building
 block to achieve infrastructure as code. As we transition from long lived,
 hand crafted, and individually maintained servers to ephemeral infrastructure,
 we gain the benefits of repeatable automation by coding, collaborating,
 testing, delegating, and removing the mysteries of infrastructure deployment
 and operations for applications.

# Ye Olde System Administrator #
IMG: Interlocking puzzle pieces

Configuration Management can help automate "all the things" by capturing
 system and administrative operators' brilliance.

Let me share a profile of the stereotypical operator:
 they are a person of responsibility charged with the duty
 to keep the business operations of the organization up and running.
 Typically, their domain covers the compute, network, storage, and
 application infrastructure as well as maintenance, backup, security, audit,
 licensing, and disaster recovery operations. They often also cover the
 Information Technology (IT) needs of an organization:
 mail, spam filtering, file sharing, identity, and major business applications
 hosted in-house such as databases, web sites, internal applications,
 and the suite of finance, sales, support, and marketing tools.
 They administer all of these systems throughout their life cycle of upgrades.

Because security and business continuity is of paramount importance to keep
 the organization performing, administration is not shared for infrastructure.
 Even development environments, laptops, and desktops can be locked down
 and constrained to prevent drifting into an unsupported state.

Change control review boards constrain work, change control windows and planned
 downtime for maintenance are required for atomic upgrades, and a continual
 need to shrink the budget of any IT expense increases responsibility
 and load while and decreasing IT resources (budgets, equipment, and staff).
 Change controls are extended to cover as many systems as possible
 to drive risk out of managing infrastructure and applications.
 The worst behavior can emerge in people to abuse their power
 and this has been famously captured by the fictional
 [BOFH: Bastard Operator From Hell inspired by reality](https://en.wikipedia.org/wiki/Bastard_Operator_From_Hell).

A traditional system administrator names their servers
 and hand maintains the infrastructure and applications
 (we will revisit these pets shortly), sometimes with the help of scripts
 or manually instrumented tools. A frequently cited metric of success for
 traditional operators is having system up time spanning years!
 Administrators take disk images of their systems and maintain a large,
 rotating offsite archive inventory of tapes containing the backups.
 The overriding challenge to system operators is to maintain the steady,
 static state of their systems and all change is assessed as a risk.

Early in my career, I admired the responsibility and power of system operators
 and so I wanted to become one of them because I needed to figure out
 how to get my applications to run on their infrastructure.
 Once that was accomplished, then I wanted to learn how well my applications
 ran in production. I learned how to work within a certain amount of policies,
 procedures, and bureaucracy in order to deploy and improve my applications.

# DevOps Unlocks Progressive System Administration #

However, looking back on the traditional system administrator,
 there are many fair criticisms to their practices that are not justified
 in today’s competitive marketplace which demands engineering agility.
 With virtualization via public and private cloud infrastructure,
 system administrators are greatly liberated from the constraints of
 static, physical infrastructure and can apply new DevOps tools and skills.
 These opportunities are captured by a few simple, reinforcing principles:

## Fail fast, fix fast ##
* Principle: embrace continual smaller changes to minimize risk, rather than constrain and batch up many larger changes subjugated to large change control windows.
* Benefits:
  * work and changes are unblocked so that value flows quickly to the customer
  * automated change for "hands-off" operations, laying the groundwork for delegation of changes to any system.
* DevOps work Implications:
  * requires better auditing and better revert operations
  * changes should be testable.

## Infrastructure as Code and Configuration Management ##
* Principle: capturing system administration provisioning and operational tasks enables collaboration, testing, and automation for ephemeral infrastructure.
* Benefits:
  * most static infrastructure backups become obsolete because the state needed to be preserved is represented by data
  * infrastructure can become ephemeral, robust, repeatable, testable, and delegatable through automation.
* DevOps work Implications:
  * static infrastructure is brittle, single points of failure are reduced because now they can be reproduced and refactored
  * need to master and maintain configuration management systems.

## Pets versus Cattle versus Bacteria ##
* Principle: infrastructure synthesis and build artifacts trump static state maintenance, i.e.: no longer do we have long lived, named servers (pets), but we have a herd of servers that we terminate regularly (cattle) for operations on the population.
  * __Pets__ = long lived, named servers which are maintained by hand
  * __Cattle__ = a herd of numbered servers which are maintained by automation.
* Benefit:
  * operations accelerate to replace broken or under performing servers rather than fix by hand
  * engineering agility increase is reflected by infrastructure life cycle decrease.
* DevOps work Implications:
  * operations orient to fleet maintenance, requiring change or expansion in logging, metrics, and monitoring
  * further life cycle decrease by diversifying application architecture towards microservices and continuous deployment of frequent application updates (bacteria)

We have an umbrella term for these principles: __DevOps.__
 Given the framework of principles and benefits above, a DevOps approach enables agility to deliver value to customers rapidly. The exists an important category of DevOps tooling which helps capture the brilliance of system administrators by turning them into infrastructure engineers: configuration management.

# Evolving to Configuration Management #

With the historical exception of the Microsoft Windows platform, which greatly expanded the population of operators by using a graphic user interface (GUI) for most system operations, it is no secret that administrators have mastered the shell and command line interface (CLI) tools to accomplish their work. By shell scripting provisioning with CLI tools, they took the first steps towards infrastructure as code.

This is where operators could cross over and find commonality with software developers as they escaped their traditional role and embarked on the journey to DevOps. Those operators who dealt with more than a handful of hand tended machines (pets) needed to reproduce their work at scale (an inevitable need to treat servers as cattle): they took the second step by refactoring their scripts to remove hard coded values and use variables instead. A third stage was reached when they found repeating code in their scripts that was refactored into functions and eventually organized into libraries.

As operators ventured deeper into infrastructure engineering, questions arose about how best to manage systems, applications, and operations across different operating systems and hardware architectures because applications could break even with an operating system update, hardware refresh, or driver patch. Every permutation of change could be an exception case that needed to be handled and this increased the complexity of their scripts. There was also a need to store the values and drive those variables into their scripts as well as a need to keep a running inventory of the deployed systems for subsequent life cycle operations (monitoring, upgrades, etc.).

# The Configuration Management Industry #

Configuration Management began to address the problem for how to automate and scale the life cycle operations across a fleet of server resources: it represents the next step after provisioning a nascent infrastructure resource to install and configure it to perform a certain role, such as a web server, database, etc.

This is a field ripe with innovation because there is a natural desire for every operator to automate their operations, but there are so many use cases, human bias, and pride to home grow their efforts for their organization that we inevitably see conflict in how best to automate because there is (always) more than one way to do it! However, the drawbacks to home grown automation are many, including the burden of in-house software maintenance and support. Our white paper “Calm IT Down: DevOps Automation in the Container Era” describes the challenges of in-house automation software efforts and justifies Calm’s approach to model application life cycle and operations.

The field of system configuration management took a seminal (but perhaps not the first) step forward with Mark Burgess’ CFEngine in 1993. Rather than program with shell scripts (with the required permutations of complexity), a simple text declaration of desired state could be authored and CFEngine would work to accomplish the results. This model has been reproduced many times in the industry, leading to a few major players today with funny names which embrace their conceptual themes:

| Name | Year Started | Agent-less? | Language | Infrastructure as Code Format |
| --: | :--: | :--: | :--: | :--: |
| Puppet | 2005 | No, but can run stand alone | Ruby | Domain Specific Language |
| Chef | 2009 | No, but can run stand alone | Ruby | Ruby |
| Salt | 2011 | Yes, but can run client/server | Python | YAML |
| Ansible | 2012 | Yes, but can run client/server | Python | YAML |

Some notes on these leaders:

* Puppet: open source with enterprise licensing/support at [PuppetLabs](https://puppet.com/)
  * Luke Kanies wanted to advance the state of system engineering past CFEngine
  * Robust community contributing to Puppet Forge of modules.
  * Excellent feature set, widely deployed.
* Chef: open source with enterprise licensing/support at [Chef Software](https://www.chef.io/)
  * Adam Jacob and colleagues created a system operational framework for their clientele before making it a product: Chef recipes are Ruby, but you can use basic notation to describe your infrastructure without using code.
  * Robust community contributing to the Supermarket of cookbooks and recipes.
  * Chef encompasses an ecosystem of products for continuous delivery and auditing now.
  * Chef agent can be changed to Chef-solo and Chef-zero to avoid a server-client relationship.
  * Excellent feature set, widely deployed.
* Salt: open source with enterprise licensing/support at [SaltStack, Inc.](https://saltstack.com/)
  * Thomas Hatch wanted to improve data center automation, making it fast and dependable compared to other solutions.
  * Salt formulas represent a communal effort of various software stacks, applications, and package automation.
* Ansible: open source with commercial products at [RedHat](https://www.ansible.com/)
  * Michael DeHaan worked to unite and simplify system administration and application deployment after working at Puppet and having developed other provisioning tools.
  * Robust community contributing to the Galaxy of roles and playbooks.
  * Compared to the others, Ansible is disruptively simple for most people to become productive, Red Hat acquired them in 2015.

# Choosing a Configuration Management System #

There are many considerations, but here are some guidelines for your organization to choose a configuration management system:

* If you have a love or hate of Python or Ruby and that value is shared in the organization, that should help eliminate some choices because you may need to customize.
* If you need to be instantly productive, look for existing modules that match your environment and try them out.
* If you have a smaller set of machines or are just getting started, Ansible has proven to be easiest to start with.
* If you need to work with a large scale of machines in a data center, Salt excels at this use case.
* If you need to work with a large set of machines in the cloud, Puppet and Chef have been widely deployed at large enterprises, Salt less so. Ansible has yet to be proven to work at large scales.
* Supporting the Windows platform differs between the offerings: is this import to your organization?
* Consider what it takes to add testing to your infrastructure!

For configuration management to be a success, regardless of which choice you abstractly evaluate, you must always consider your audience and navigate the culture of your engineering and operations organizations.

Once adopted, a configuration management system may become entrenched
 and worshiped like a religious practice because of the success it brings!
 It is an amazing, intoxicating day when a team can say they have automated
 "all of the things" ([a popular meme](https://memegenerator.net/X-All-The-Things))
 because they have broken away from pets.

This pride is justified because they have achieved the benefits of doing DevOps;
 however, binding to a single tool to the exclusion of the market can blind
 an organization to innovation. For instance, testing, operating, and
 orchestrating "all of the things" becomes the next set of challenges
 where early design constraints or lacking features could cause
 reconsideration for the next stage of the journey.
 Upgrading a configuration management system to a new version can introduce
 incompatibilities and cause an organization to embrace risk adverse tendencies,
 which runs contrary to DevOps values. Shouldn’t it be possible to mix and
 match configuration management versions for different teams,
 refactor between configuration management systems for different projects,
 and even orchestrate multiple configuration management systems at once?

# Epilogue: the Death of Configuration Management? #

Most demonstrations building and deploying application containers are without a
 configuration management system. There are pros and cons to this approach,
 which are discussed in
 [Reconciling Configuration Management and Immutable Infrastructure](/post/calm.io-recap/calm.io-reconciling_configuration_management_and_immutable_infrastructure/),
 but configuration management represents an excellent way to deploy container
 container PaaS and hosts as well as applications.
