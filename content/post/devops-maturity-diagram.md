---
date: "2017-04-12T12:00:00-07:00"
tags: ['DevOps', 'maturity', 'diagram']
title: "The DevOps Maturity Diagram"
draft: false
---
The opening of
 [my first Calm.io DevOps article](/post/calm.io-recap/calm.io-i-dream-of-devops-but-what-is-devops/)
 started with:

>Let me share what I’ve learned on my journey to DevOps: it is a culturally
 rendered term and it has a different meaning for everyone.

In that article, I go on to define DevOps and explain the term:

> <div style="text-align: center; font-weight: bold; font-size: large;">DevOps
 is the <em>process</em> of removing all friction
 <br />between the developer and customer value.<br /><br /></div>

<!--more-->

# Inspiration #

How do you explain DevOps to the uninitiated or to a non-technical audience?

In August, 2016 [Nutanix](https://www.nutanix.com/products/calm/)
 acquired my employer, [Calm.io](/tags/calm.io). I became the first
 DevOps Solutions Architect in Sales Engineering, a subject matter expert
 overlay role that supported North America.
 At Calm, our audience was the DevOps practitioner and my colleagues,
 especially [@Aaditya](https://twitter.com/aaditya)
 and [@JasnoorGill](https://twitter.com/jasnoorgill),
 had created a higher-level pitch for investors to understand the need for DevOps.
 Nutanix had a broader and more traditional IT, Data Center,
 and Operations audience. Every day, I struggled to
 explain the benefits of DevOps in under a minute and my "elevator pitch"
 failed more often than succeeded. Every failure and success inspired me
 to do better and I constantly asked for feedback to improve. I still do!

## Mentoring ##

Two discussions with Nutanix executives were another set of inspirations:

* In December, 2016, I spoke with Nutanix Chief Development Officer,
 [Sunil Potti](https://www.linkedin.com/in/sunilpotti/)
 [@sunilpotti](https://twitter.com/sunilpotti),
 and he explained how Calm's integration into the Nutanix control plane made
 the platform stronger in contrast to the separate, diluted, fragmented
 experience that competitors continually bring to market.
* In January, 2017, I spoke with Nutanix Chief Architect (now co-CTO),
 [Binny Gill](https://www.linkedin.com/in/binny-gill-015977/)
 [@binnygill](https://twitter.com/binnygill),
 and he explained how Nutanix aspires to increase feature automation
 (*e.g.:* storage compression) while removing feature controls from the
 user interface. The feature can be hand-tuned via command-line if needed,
 but the administrator has oversight via feature performance summary graphs.
 The result is a platform value increase while customer complexity decreases,
 something Nutanix aspires to achieve much as Apple's iOS has done.

In hindsight, I could see both discussions partially explained as a learning
 of the "Consumption Gap." Other Nutanix colleagues used variations of the
 "Consumption Gap" diagram from
 __[Complexity Avalanche](http://blog.tsia.com/blog/your-strategy-for-escaping-the-complexity-avalanche)__
 by J.B. Wood in 2009 (the same year the term DevOps was created) to explain how
 Nutanix hyper-converged infrastructure software data and control planes reverse
 complexity in an organization: all of these combined into another inspiration.

## Business Outcomes ##

In February, 2017, the Nutanix mid-year sales kick off included an intense
 sales methodology training based on selling positive business outcomes to
 customers. It galvanized me to figure out new ways to communicate about DevOps,
 Nutanix, and Calm. Abstractly, the sales methodology is similar to the TSIA
 [Digital Transformation Journey Infographic](http://blog.tsia.com/blog/navigating-the-world-of-digital-transformation-offers-infographic).

# Preparation #

January 25, 2017: I gave a Calm deep dive session to my peers at Nutanix,
 and there were two topic requests that shed light into the DevOps world
 for them and provided insight
 (the what, who, why that Nutanix management always cites)
 for the Calm automation product's value and audience for DevOps.
The first topic was, "What does a software developer do?"
 and I showed the [DevOps Automation Diagram](../devops-automation)
 to explain the value chain between the developer and the customer,
 then showed the [Build, Test, Deploy pattern](../devops-btd-pattern).
The second topic was, "Why do I need DevOps?" and I landed on
 the roughly ten? steps it takes to refactor from monolith
 to hybrid cloud applications to show how automation accelerates
 all efforts. *TOOD: I still haven't blogged on this!*

April 9-13, 2017: I was at Nutanix headquarters preparing
 to speak at the third annual Nutanix .Next User conference with
 4000 attendees. To explain Calm's value proposition to my colleagues,
 I likened DevOps to the business outcome of *[agility](#agility-devops)*
 and Pets versus Cattle (or removing all single points of failure)
 to the business outcome of *[scalability](#scalability-removing-pets).*

## Agility = DevOps ##

[My DevOps definition](/post/calm.io-recap/calm.io-i-dream-of-devops-but-what-is-devops/)
 aligns everyone to deliver frictionless business value, however the
 impact can be summarized as business agility. When anyone can
 [build, test, and deploy](devops-btd-pattern.md) value, business processes
 are transparent and work is democratized.
 The next stage is to progressively automate these operations with key
 performance indicators and metrics for heuristically driven business operations.
 DevOps extends to run the business:
 the organization constantly tunes and expands the automation systems,
 while the employees engage to respond to new business initiatives and
 improve business efficiency, all resulting in business agility!

These benefits are confirmed by the
 [annual State of DevOps surveys](https://devops-research.com/research.html),
 which compares low to high performers on the DevOps journey. The 2017 summary
 is that high performers:

* Deliver more
* Repair sooner
* Automate more

 ... meaning that the high performers achieve agility delivering value with
 DevOps, run higher quality operations with less downtime,
 and invest their productivity gains back into further automation
 in order to continue a positive feedback loop of DevOps success.
 DevOps success accomplishes the very definition of an agile business,
 which accelerates away from their competition.

My interpretation is that the high performers have achieved DevOps maturity,
 which I will illustrate with the second diagram. High performer DevOps
 maturity perfectly aligns with
 [my DevOps definition](/post/calm.io-recap/calm.io-i-dream-of-devops-but-what-is-devops/)
 because they have achieved agility.

> __Devops Evenglism Slides forthcoming:__
 they are an update, expansion, and summary of my earlier work
 [DevOps Demystified ](../devops_demystified)

## Scalability = Removing Pets ##

Understanding that the lens of
 [pets versus cattle](http://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/)
 allows one to evaluate and remove every single point of failure by working to
 replace each pet with distributed resources under fleet management
 and service level agreements. Any organization can progressively refactor
 and remove their pets to unlock unprecedented levels of scalability.

Upon adopting this lens, the entire world looks different and it is
 easy to identify the traditional values which no longer apply.
 Continual discovery reveals invisible prison bars which constrain progress.

> __Devops Evenglism Slides forthcoming:__
 they are an update, expansion, and summary of my earlier work
 [DevOps Demystified ](../devops_demystified)

# First Diagram: DevOps Journey #

I arrived at graphing the abstract progressions of both agility and
 scalability to create the __DevOps Journey Diagram__. I reversed the initial
 axes layout and I arrived at Gartner-like diagram which yielded instant
 "up and to the right" parsing at a glance. The diagram yielded insight into
 the successive stages for a journey to DevOps to travel from the lower left
 quadrant to the upper right quadrant.

![DevOps Journey Diagram](../devops-journey.png)

With my career experience, confirmed by speaking to peers at DevOpsDays
 as well as many Calm.io and Nutanix customers,
 I identified the DevOps Journey Stages. Success!
 I added a side explanation for the stages of the journey to help orient
 where one might be and where one could go next:

|Stage|Outcomes|
|-----|--------|
|0|Hand maintained monoliths, in a pet data center, with backups for revision control|
|1|Programatic change controls and operations|
|2|Deploy new workloads with configuration management|
|3|Cattle everywhere: build test driven infra artifacts, hybrid cloud deployments, KPI driven operations|

In April 26, I presented the DevOps Journey Stages diagram to a large defense
 contractor and before I completed my explanation, one of the audience said,
 "we're a pet shop and depending on the team, we're between stage 0 and 0.5."

The first diagram was incredibly effective, but I knew I was conflating many
 concerns. For example, re-platforming a data center onto Nutanix improved
 infrastructure by migrating to a distributed system (pets to cattle)
 moving up along the vertical access, but it also progressed automated
 operations to the right along the horizontal axis. It didn't make sense
 that each moved independently along a separate axis, but the combination
 did make sense along an "up and to the right" diagonal.

## Conflation and Oversimplification? ##

The combination of infrastructure and operational automation implied multiple
 aspects of journey. Progress could be made in any dimension by a siloed
 infrastructure or operations team by adopting the Nutanix platform, but this
 success would only be for the "Ops" side of the organization. It would
 ignore the other side of the DevOps equation, the "Dev" or developer impact
 that could be achieved by extending to application infrastructure and the
 software development life cycle. The combination of both sides of the house
 is the realm of DevOps and it addresses the total delivery of business value,
 further reinforcing
 [my DevOps definition](/post/calm.io-recap/calm.io-i-dream-of-devops-but-what-is-devops/).

So how could one address the multiple aspects and progressive stages of the
 DevOps journey across the entire organization? What could convey additional
 complexity, recognize the inherent traditional organization silos,
 and enhance the first diagram without spoiling its simplicity?

## Decomposure Aligns Parallel Journeys ##

I worked to decompose the journey into four parallels, each
 representing infrastructure, architecture, operations, and culture.
 While any parallel could be its own isolated journey for a siloed team,
 when aligned and combined together, the overall organization could achieve
 advanced stage outcomes, yielding the second diagram.

A legend not only helped explain the stages of each parallel, but also
 illustrated the advanced business outcomes of a mature DevOps organization
 through examples. The examples show how DevOps can align different teams,
 responsibilities, and agendas to transform an organization to achieve
 agility and scale.

|Stage|Infrastructure|Architecture|Operations|Culture|
|-----|---|---|---|---|
|0|Single server, single datacenter|Monolithic|Hands-on|Silos|
|1|||Repeatable|Governable|
|2|Syntheized, ephermeral|Distributed, scale out|Delegable deploy+ops|Testable with metrics|
|3|Hybrid clouds|Global + active|KPI driven lifecycle|Data-driven experiments|

# Second Diagram: DevOps Maturity #

![DevOps Maturity Diagram](../devops-maturity.png)

On June 29, I presented both diagrams on stage at .Next D.C.
 for my portion of the talk "AW209: Agile Infrastructure for Mode 2 Apps,"
 with my colleagues Ray Hassan (Nutanix) and Allan Naim (Google Cloud).

# Update: 2018-05-03 #

My proposal was accepted by the organizers, voted upon by the attendees, and
 delivered as a talk at DevOpsDays Austin,
[How to Sell DevOps in Under an Hour](https://www.devopsdays.org/events/2018-austin/program/mark-lavi/)
 with this abstract:

> You've entered a new customer's conference room,
 the introductions are complete, and you have the remainder of an hour to
 change their traditions: how would you explain and sell DevOps to
 non-technical management, engineering, and IT?
 For the past three years, I've travelled to small and large businesses
 around the world to explain how DevOps can continually impact
 any organization and I've evolved to speak the language of business
 and demonstrate positive business outcomes.

> With two simple definitions of agility and scalability
 (better known to our community as "DevOps" and "Pets versus Cattle,"
 respectively), you can explain and diagram the stages of a DevOps journey
 to any organization. Once the journey has been mapped out,
 it can be deconstructed over parallel dimensions of cultural,
 architectural, operational, and infrastructure progression
 to illustrate how any organization can achieve DevOps Maturity.
 I’ll show early work on how we're building with our customers
 cost metric models to determine DevOps total cost of ownership.

I didn't get to the DevOps TCO model, but I was happy
 John Willis [@botchagalupe](https://twitter.com/botchagalupe)
 was at the talk and he helped define DevOps, agreeing that it is cultural:
 "at the end of the day, it is what you make of it."
