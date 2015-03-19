+++
date = "2015-03-18T21:02:15-07:00"
status = "draft"
tags = ["DevOps", "pattern", "build", "test", "deploy"]
title = "DevOps BTD Pattern for Continuous Deployment"

+++

### Code Friction and Service Design ###

I created the [DevOps Automation Diagram](../devops-automation/) to map out the flow of code from
developer to production in a wholly automated manner: better known as continuous deployment.

This map represents the software development life cycle, service deployment, and feedback loops that are
integral to service design. I did this so that I could figure out where best to start work for my
infrastructure as code project and I found a few optimizations by refactoring the code flow and
moving processes forward in the chain of events.

In doing so, I describe a journey that spans different disciplines of build, test, and deployment:
areas that have been traditionally separated into team or department silos because they represent
the pillars or domains of software development, quality assurance, and operations.

![BTD Silos - 2015-03-18](/img/btd-pattern-traditional.dia.png)

Those traditional silos create code friction by introduce manual hand offs and insulating teams
from each other, which creates barriers to proper service design and life cycle considerations.

"It's not my job," "it works on my laptop," and "I don't like the [other team's] attitude" are
verbal indications of code friction. They are blockers for engineers to embrace their responsibilty
for service design over the entire life cycle of code.

### BTD: Build, Test, Deploy Pattern ###

We've talked about breaking down the traditional walls between software development, quality assurance,
and operations by describing a responsibility for all of these teams to embrace all of the disciplines
of BTD (build, test, and deployment) in order to become proper service designers.

I call this the BTD pattern, but astute readers will note this should be the TBD pattern! :~)

BTD is nothing revelatory, it is the traditional pipeline for software development.
The [DevOps Automation Diagram](../devops-automation/) at a high level *is* a BTD pattern,
but we will examine it further and find BTD should exist in each domain.

1. **Build:** SoftwareDeveloper codes functionality and *builds* the code
2. **Test:** QualityAssurance creates *tests* for the build artifacts
3. **Deploy:** Operations *deploys* the artifacts

What is wrong with the BTD pattern? Nothing except how it has been implemented as traditional roles and handoffs, e.g.:

![BTD Silos - 2015-03-18](/img/btd_silos.pu.png)

...you can see the traditional silos and you can see all of the potential handoffs and inefficiencies
to remedy a bug. The cost and time to fix increases the further the bug is discovered from the developer.

### DevOps BTD Pattern for Continuous Deployment ###

We need to prevent bugs from happening in deployment, in test, and in development.

- Did operations create a deployment bug? How did they test it?
- Did quality assurance develop a good test? How do you test the tests?

BTD must be applied at the build domain, at the test domain, and at the deploy domain.

![BTD Pattern - 2015-03-18](/img/btd-pattern.dia.png)

This is why everything is testable, buildable, and deployable on the developer laptop in the DevOps Automation Diagram.
The traditional software developer or recent college graduate, system administrator, or quality engineer
does not code tests, code deployment, and code builds, then test deployments and test builds:
this expanded skill set must be part of the engineering culture for service design and imbued into all.
