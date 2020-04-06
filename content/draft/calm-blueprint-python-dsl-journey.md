---
tags: ['Calm', 'DSL', 'blueprint', 'continuous-integration', 'python', 'GitOps']
draft: true
date: "2020-04-04T11:13:25-05:00"
title: "The Calm Blueprint Python DSL Journey"
---
Calm blueprints are business artifacts incorporating infrastructure, operations, and governance as code, powering business initiative with self-service and continuous operations. The Calm blueprint life cycle belongs in the domain of software engineering with collaborative revision control, CI/CD, and GitOps. These methods have been accelerated by the Calm blueprint Python DSL: Domain Specific Language!
<!--more-->

The term blueprint is overloaded: it can be used by many different tools to describe how they model the world. However, the tool capabilities often are limited to a particular aspect.

# Why Calm Blueprints?

Blueprints are software incorporating infrastructure, governance, and operations for birth to death of an application: they model your business procedures.

# Why Calm Blueprint Python DSL?

In short: programming languages, combined with data formats, bridges to the world of software engineering benefits and provides a next generation experience.

I will overgeneralize the previous generations of automation as an evolutionary progression of successive and overlapping areas:

- Command line interface (CLI) shell scripting
  - Typically sequential and hard coded
- Client-Server operating system automation
  - Typically command and control of shell scripting with inventory and audits
- Configuration Management:
  - Next generation shell scripting, e.g.:
    - Puppet: DSL
    - Chef: Ruby DSL
    - Salt: YaML/TOML
    - RedHat Ansible: YaML
  - Additional benefits, which are less often realized:
    - provide machine inventory
    - can abstract OS
    - can orchestrate multiple roles
    - can audit and remediate state drift
- Infrastructure as Code
  - HashiCorp Terraform: HCL (~YAML)
  - (just for fun) Kubernetes: YAML

The benefit of these data formats (such as YAML, JSON, XML, TOML, etc.) is that they are open and foster interchange across many tools, libraries, and services to consume them, which increases their value and adoption.

The problem with data formats is that they are schema and data, used to model the literal or declarative configuration of systems. The model is constrained to the engine that will interpret, implement, and operate that configuration.

This has been an effective method for many to adopt automation, so long as the "out of the box" capabilities are exploited by a skills investment to understand both the data format and engine operations. Arguably, the skills investment is small enough for success, however it is proprietary in nature. e.g.: I cannot take my HCL skills anywhere else but to a Terraform shop.

So the complexity returns to automation adoption: the data format must be extended through proprietary conventions to approximate new functions. Those functions usually fall into two categories:

1. Programming features (conditional logic, loops, events)
2. Engine plug-in extension configuration.

We will address the second in a moment, but let's explore the first functional extension to a data format.

An operations manager required tools to be compatible with their staff of "YAML developers." This certainly was an indication of automation success, but it was also a tacit admission of tunnel vision and state of their programming skills. First, JSON is a subset of YAML, many tools exist for bi-directional conversion, therefore there can be transformation between data formats: so a choice of data format could and should be arbitrary. Second, any transformation will not likely accommodate work between engines, revealing the operations manager probably conflated data format and engine. This realization brings us to the next level of strategic understanding: the platform.

Even when an automation engine is open source, it is effectively a "black box" which cannot be customized without drifting out of the support model, thereby driving the burden of maintenance and availability back to the customer. We seee this over and over with ERP and CRM systems like Oracle EBS and SAP, even SaaS systems such as SalesForce: all of them become some customized and extended that they become wholly proprietary, extremely hard to leave, and have a much larger maintenance burden. Innovating on

while new plug-ins extend the capability of the engine and require corresponding investment to configure in the data format to harness. Both dimensions change the investment from a simple tool choice into a proprietary platform, dependent on a partnership of in-house skills and third party vendors, who may operate under open-source community support models.


 next-generation infrastructure as code by opening our work to

 real infrastructure as code:

# Python and PEP8

- https://www.python.org/dev/peps/pep-0008/

# The Calm Blueprint Manifesto: Digital Transformation

Blueprints are software incorporating infrastructure, governance, and operations for birth to death of an application, representing the cross-functional intersection of different disciplines, roles, and responsibilities. By implication, the organization's culture will be challenged. Traditional silos for division of responsibility will resist changes which delegate power, adjust procedures, and augment skill sets. However, these are the requirements to contribute to a collaborative, shared environment of responsibility.

The benefits are profound: self-service business artifacts with continuous operations driven by key performance metrics.

On-demand implies the ability to democratize any initiative: give me one more of those for an experiment, troubleshooting, testing, development, and production scenarios.

Continuous operations implies: let me continually improve and adjust the business while it is running to better meet customer needs through increased customer satisfaction and evolving features.

Often, a Calm blueprint's potential to model the business is constrained by the culture and operational model of the people and organization barriers. Furthermore, the blueprint implementation is further limited to the incumbent procedures and vendor capabilities, which foster the business as usual and cultural norms.

Upon adopting a blueprint life cycle model, modernization and digital transformation efforts can truly begin because the current operational model has been captured as software. Upon arriving at this moment, moving forward on re-engineering the organization can be done with safety, transparency, and delegation at every level: giving every member the ability to advance the entire organization with every change.

So while it is a heavy lift to change the culture and procedures, it becomes an obvious evolution only in hindsight. It is rarely successful in a skunk works, bottoms up manner because of the silo limits of effectiveness: entire processes remain subordinate to the slowest constraint across the organization. It is a rare leader that can envision the destination and defeat every cultural obstacle along the digital transformation journey, because technology is the enabler, no longer the challenge. This "top-down" approach requires a sponsor and champion in order to be successful. The risk is immense because the impacts on jobs will foster continuous improvements, which feels contrary to stability, but an agile approach, combined with modern software engineering, automation, and DevOps culture, fosters a safe environment for innovation. The speed of innovation is only hindered by people, not their systems.

# The Blueprint Development Life Cycle
