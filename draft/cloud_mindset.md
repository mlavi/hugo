---
tags: ['cloud', 'public', 'maturity', 'hybrid']
draft: true
date: "2019-11-23T07:41:37-08:00"
title: "Cloud is a Mindset: Public Cloud Salvation"
---
Gaining public cloud experience is crucial to IT careers today because it represents virtualization's next generation experience. Immaturity themes for over-reliance on the public cloud are typically due to false hopes, Operational Expenditure (OpEx) accounting, and vendor lock-in. Public Cloud salvation is when one can drive to a new cloud maturity stage with operations and workloads to multiple clouds with blended resource management. I'll explore the causes and solutions to progress cloud maturity.
<!--more-->

## Progression

- DC = 1000 physical servers (unoptimized)
  - 1 VM cluster of 200 servers, optimized with a SAN, eliminates 80% of physical infra/ops
    - K8s cluster of 20 workers, optimized over HCI/cloud, eliminates 80% of virtual infra/ops including NW+Storage?
      - PaaS/SaaS/functions, eliminates 80% of container infra/ops

*Question: what does the 80% savings go to?*

Dimensions of:
- Infrastructure Units
  - Physical Server:
    - organization:
      - data center of 1000 pizza boxes
      - separate storage, compute, network vendor appliances
    - efficiency:
      - overprovisioned, idle capacity
      - planned for 3-5 year depreciation schedule
      - cadence (business request to ready): months
      - justify, procure, rack and stack, network, etc.
  - Virtual Machine:
    - organization:
      - virtualization cluster of a rack of 100 servers
      - on-prem or colo
    - cadence (business request to ready): months
  - Containers:
    - cadence: seconds
    - operations: as code
  - Serverless/Functions:
    - cadence: seconds
    - operations: invisible
- Operations
  - Bespoke human error
  - Automation for scale:
    - Infrastructure as Code
    - Lifecycle Operations as Code
    - Compliance, Testing/Metrics/Monitors/Logs as Code
  - Consumption models:
    - CapEx:
      - on-prem or colo
    - OpEx:
      - cloud
      - managed service provider, remote hands
    - Hybrid blend
- Architecture
  - Monolith
  - Distributed monolitic servers
  - Business tiers:
    - Security
    - Presentation
    - Business Logic
    - Data Store
  - Microservices with containers and functions
    - SaaS and PaaS
- Culture
  - Bespoke PetOps
  - Delegatable, auditable automation
  - Business heuristic KPI driven ops
  - Data driven experiments

---

## The Case for the Public Cloud ##

I've talked to many customers over the past four years across the world in nearly every industry of nearly every size.

Many people in IT have built their career on virtualization, but in 2005 I was lucky enough to work at a high performance compute Unix/Linux hardware+software company (SGI), mostly skip on-prem virtualization, and jump exclusively into the public cloud for my next job at a Silicon Valley start-up in 2011.

The public cloud is alluring for many reasons:

- On-demand infrastructure
- Platform as a service offerings
- Developer self-service
- OpEx experience
- Outsourced support

I find that as much as customers extoll these public cloud benefits, their cloud maturity prevents business efficiency, leading to negative outcomes of false hopes, OpEx Accounting,  and lock-in. After explaining these pitfalls, I will show how cloud maturity leads to solutions which prevent or correct these business mistakes, and achieve public cloud salvation!

## Public Cloud Pitfalls ##
### False Hopes ###

I am astounded, even today, when IT organizations and their management, still promulgate the public cloud as their business' salvation.

### Hypervisor Migration ###
### OpEx Accounting ###
### Vendor Lock-in ###
Proprietary APIs and Hotel California effect for workloads, due to network transit costs, every public cloud is a fiscal island.

## Cloud Maturity for Public Cloud Salvation ##

Because the public cloud is easy and quick to consume, it allows adoption to occur without proper consideration or responsibility. I observe the rush to public cloud and with enough time, the complaints of expense, and eventual retreat or resource rebalance.

The fundamental problem is that most adopters have no immediate fiscal responsibility. Even the most senior IT leadership of fiscal institutions plan to exploit and maximize their annual spend budgets over gaining efficiencies by subordinating their expenditures because of basic human nature: it will always be easier to spend than to save. Only maturity and responsibility change our viewpoint from short term expenditures to long-term, efficient resource management.

### Blended Resource Management ###
### Resource Lifecycle Management ###

## Cloud First has already become Cloud Smart ##
https://www.whitehouse.gov/briefings-statements/omb-announces-cloud-smart-proposal/
---
<!--more-->
*Rahul feedback:
versus a plain datacenter: sw defined infra, automation makes workloads agile, APIs, software defined.*

Welcome to the Hybrid Cloud Engineer Nanodegree, presented to you through a
partnership between Udacity and Nutanix.

Hello my new friends, I'm Mark Lavi, the Principal DevOps Advocate at Nutanix,
and we're going to give you the benefits of hard won experience gained through
the decades and then combine that experience with state of the art capabilities
to give you mastery over the global software and hardware titans.
You will learn about the current battle for the Information Technology (IT) to evolve
and the strategy required to make the industry titans continually compete for your attention
by leveraging all of them when and where you deem best, keeping you in control.

The year is 2020 and you won't find this knowledge in any college level computer
science course, a trade school, or even one of the disruptive coding/DevOps boot camps
around the world. The global industry leaders in hardware and software are quick
to embrace the term hybrid cloud, but they often abuse it for the purpose of locking you into
their platform exclusively.

You, my friends, are about to learn how to make any organization run efficiently
and dynamically anywhere. Most importantly, you will have choice on how to change
your operations anytime, on-demand.

Are you ready to begin the journey to Hybrid Cloud Engineer? Let's begin!

I find that is it best to start by concretely defining terms to insure we remain
united in our understanding. This will remove any assumptions and prevent confusion,
but more importantly, you will be on guard for those who have or are trying to manipulate you
with outdated notions.

- Hybrid: a combination of more than one type of anything.
  Examples:
  - on and off premise
  - multiple hypervisors, on-prem
  - multiple public clouds, off-prem
- Cloud: NIST definition
- Engineer: one who can design and implement technology.

In summary, a hybrid cloud engineer can operate workloads on multiple infrastructure providers.
The best hybrid cloud engineers will retain control so that they have choice of vendors for where to operate
workloads, able to leverage the best of what the global market offers, on-demand.
I consider this a tectonic shift of power in how business is run and your mastery will
make employable anywhere where a single or few vendor choices have already been made for you.
But over time, not only will you be able to modernize any organization, but you will
also find the entire industry increasingly requiring hybrid cloud engineering capabilities
to compete on a global scale.

The cloud drives % of the world's GDP
The cloud leaders are: FB, Apple, AZ, NETFLIX, VMWare, MSFT, GOOG
The primary revenue of GOOG, FB, Twitter is advertising: you are the product.

Because AWS started in 2006, for the majority of the world, compute was on-prem
datacenters or colocation or managed service providers. The conversion from physical
to virtual machine was ongoing. Competition of VM across VMWare ESX, Microsoft Hyper-V,
and Xen Server amongst others like Linux KVM continues on-prem.
And today, in 2020, these factors continue, but are often mixed with public cloud.

The situation today, in 2020, is that we still have a great divide between the
organizations that were born and raised in their own datacenters on-prem versus
the newer organizations that were born and raised in the public cloud. Both are
evolving to further master their domains.

For the on-prem p2V of legacy systems and improvements
to offer a private cloud experience under a financial capital expenditure model.
For the public cloud: controlling their financial operational expenditure by comparing
clouds and consumption models, which include on-prem.

Both sides of the private and public cloud divide agree upon one thing: the future
is hybrid cloud: a blended experience which mixes the best of both models. This
is an evolving field of offering between public and private cloud providers and it
represents the maturity of the industry to recognize what other industries have
already pioneered and evolved to. The energy industry is a fundamental requirement
for our society and is consumed as a utility: you pay for what you use and this would
suggest why the public cloud is a popular and easy choice today. However, the manner
the manner in which the energy utilities operate today is hybrid: base line power
generation is always provided on prem, with additional capacity brought on and off-line
as peak demands rise and fall over time each day. That additional capacity is from
additional base stations coal, oil, gas, nuclear and other much more burstable technologies such as renewables: solar, wind. There are multiple tiers that combine together for a hybrid solution.

Thanks to the competitive public cloud market covering most of the world, businesses often have choice of
providers located close-by with major Internet access points. The result is on-demand infrastructure and service have been democratized, made available to all sizes and sectors of business, and
the entire business world has expanded to new models of consumption, time to market, and scale,

Therefore, a popular corporate IT strategy is to be "cloud first," which means
driving workloads to public cloud providers and eschewing on-premise workloads.

Amazon Web Service (AWS) is an undisputed market leader in public cloud, helping establish the industry
that Google Compute Platform (GCP), Microsoft Azure, IBM Cloud, Oracle Cloud, AliCloud and many others follow.

Yet escalating cost, data transit and data sovereignty considerations, even the constant and disruptive expansion
of Amazon into many industries must weigh in the decision for which public cloud provider to choose.
As in all parts of business, without proper resource management,
unchecked costs can skyrocket, and the operational expenditure consumption model of the public cloud which makes it very easy to start and have fractional consumption, often result in a reconsideration.
At this point, unless considered when evaluating which public cloud to choose, the implicit vendor lock-in and switching costs are rarely considered into the decision.

You may have noticed that I've explicitly used the adjective "public"
 nearly every time I've used the term cloud.

Public cloud providers offer new hybrid solutions: Google Anthos, AWS Outpost, and MSFT Azure stack.
---
- Introduction to HCND (1 hr)
  - Overview
  - Project Scenario
    - Fictitious company, CEO mandates it to be in multiple clouds to control costs
    - multi-tenant capabilities, people can run their workloads indepdenently
      - cost controls and RBAC
    - multi-vendor strategy, no single point of failure
- Capstone Course 1: configure an on-prem cluster, stand up PC management workload
- Capstone Course 2: design a hybrid workload with Python
- Capstone Course 3: automate an on-prem, private cloud 3 tier web application, provide WindowIaaS
- Capstone Course 4: extend web tier to a public cloud, global load balance

---

Web scale infrastructure requires web scale application architecture and operations.
Operations at scale cannot be performed by hand: you have already lost the game if
you think you can solve a problem in production by looking or fixing one server.

One must re-imagine the business of IT to deliver a cloud experience and often,
this means shedding traditional approaches to achieve a "digital transformation."

Infrastructure + Apps + ops + culture must progress to hybridize and share responsibilities.
I happen to call this state the result of adopting DevOps and can elaborate...

Calm was born from bare metal data center orchestration workflow engine called Epsilon.
Epsilon is written in Python and has a microservice architecture so it could scale workers for parallel orchestrate execution on large data centers.
Workflows are python scripts.

Calm grew out of the need to address private and public cloud infrastructures, by adding a GUI to abstract
any type of infrastructure service to deliver applications. This top down model of
the application allows it to be driven onto multiple infrastructures.

---
# Map of the World

## IaaS

Typically anything behind Apache libcloud and jcloud libraries or Packer deployable

- Public Cloud
  - AWS
  - Linode, etc.
- Private Cloud (on premises)
  - Apache OpenStack (AWS clone)
  - Apache CloudStack (AWS clone in Java)
  - Pivotal Cloud Foundry (Bosh operates on Stemcell VMs, release artifact.tar, deployment manifest)
  - VMWare ESX+family
  - KVM
  - Citrix Xen
  - Docker Containers, etc.

## PaaS

Platform as a Service providers, many IaaS go up the stack.

- AWS Elastic Beanstalk
- Heroku: https://devcenter.heroku.com/articles/architecting-apps
  - buildpack (runtime) compiled to a slug + configuration + procfile = Release
  - dynoformation  = dyno (container)
- RedHat OpenShift Origin: https://docs.openshift.org/origin-m4/openshift-pep-010-docker-cartridges.html
  - https://docs.openshift.org/origin-m4/oo_user_guide.html#create-a-jenkins-gear for CI
- IBM BlueMix (hosted CloudFoundry?)

Application management layers can go above these, in a contextual vs. compose fashion [REF:] which can allow infrastructure orchestration and application deployment.

## Oasis Standards

- CAMP: application deployablity & portability
   - http://docs.oasis-open.org/camp/camp-spec/v1.1/cs01/camp-spec-v1.1-cs01.html#_Toc403920629
- TOSCA: blueprint YAML

## Stack Layers

- Hardware
  - Boot chain: BIOS, boot loader, PXE boot
  - Compute (CPU, RAM)
  - Storage
  - Network
- Bare Metal Hypervisor & Kernel
  - Virtual Machine
    - Kernel
      - Operating System
        - init process manager
        - OS Applications
          - Audit (SELinux, Apparmor, etc.)
            - Logging/Metrics/Monitors
          - Network
            - Firewalls
          - Storage
          - Containers

# Tools:

- http://theforeman.org/introduction.html - provision VMs on bare metal or clouds using Chef/Puppet/Salt
- http://servicemix.apache.org/ event based SOA tool
  - http://www.activiti.org/components.html is a OMG BPMN 2.0 engine with modeler/designer
    - http://www.activiti.org/userguide/index.html#activitiDesigner
    - Invoke JBOSS http://www.drools.org/ business rules engine
- https://github.com/signalfuse/maestro-ng Container Deployment Orchestration
- vs. Kubernates, Mesos, Clocker

# Goals:

- Goal: IAC + (Variable)Immutable Infra + Mobile Persistence = ephemeral stacks/environments
- Dream: Test Driven DevOps -> mock infrastructure, nirvana = behavior driven devops
- Applications > Services > Deployments
- Composable blueprints:
  - RBAC invocation for includes (keys, infra blueprint templates)
  - RBAC access to deployment variables (e.g. dev K8s cluster).
  - Github push/pull access = IAC
    - this feels like Gemfile, Berksfile, etc. a la chef environments
    - on the way to bill of materials
  - Conditional infrastructure: if...then...else
    - If $source_code_repository = http://github.com,
      - Then: include and stand up Gogs, GitLab, etc. and set variables
      - Else: ghosted out and variable set? likely redundant
