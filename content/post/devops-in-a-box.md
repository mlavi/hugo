---
date: '2018-05-05T13:42:39-07:00'
title: 'DevOps in a Box'
tags: ['bootstrap', 'DevOps', 'pattern']
---
My long time fantasy has been to demonstrate an entire CI/CD pipeline with
 continuous operations of applications to discuss behavior driven operations
 and testing as monitors.

The call for this happened over and over at DevOpsDays to answer: how does one
 learn DevOps, practice site reliability engineering, or have a full
 application lifecycle environment?

So let's create a minimal viable product [BTD scenario](../devops-btd-pattern)
 of my [DevOps Automation](../devops-automation) system,
 extend it to prefix Governance and suffix Management,
 and then drive maturity to illustrate and discuss best practices.
<!--more-->
I've been discussing this with my Nutanix colleagues
 [@mjasted](https://github.com/mjastad) and
 [@andytschmid](https://github.com/andytschmid/) for a while,
 so here is the outline and plan of action!

# Manifest #

Some simple principles:

- Open source components are preferred to remove licensing from the equation
  when possible
- Containerized workloads on Kubernetes are preferred, but it is okay to
  fall back to VMs and configuration management
- Work for a minimum viable product first, then add phased expansion goals.

The building blocks include:

- Authentication
  - Expansion: Secrets management
  - Expansion: Service Discovery and DNS
- Source code management repository
  - Expansion: Review system
- Build system (and initial testing)
  - Expansion: Test system
  - Expansion: file server, then Artifact repository
  - Expansion: Orchestration system
- Centralized Metrics and Logging systems with Management
  - Expansion: Monitoring
- Application hosting
- Example three tier web application:
  - Load Balancer
  - Web Presentation and business logic tier
  - Database
  - Expansion: Compliance
  - Expansion: https://12factor.net/

# Design #

The governance and management lifecycle should include:

- Provision users into groups under authentication,
  ideally with passwords and SSH keys
  - One admin account, initially
- Continuous Integration: to build and test the application artifacts
  - An update to revision control event should trigger a build, test, and deploy
    - Expansion: BTD ad-hoc for hash, branch, tag to a
  corresponding CD environment
  - Continuous Deployment of artifacts to deploy or update the application
    - Expansion: Destroy a CD environment
- Managing the example application lifecycle:
  - Database storage expansion
  - Database backup and restore
  - Web tier autoscale in and out
  - Web loading operation to trigger autoscale
  - Database loading operation to trigger expansion
  - Health metrics, monitors to trigger app operations, above

# Outcomes #

This would an incredible achievement: an ephemeral DevOps in a Box environment.
 It could be used to demonstrate application:

- CI/CD pipeline with integration testing
- integration testing as monitors
- health metrics
- failure modes
- automatic remediation of failure modes

I paraphrased and shared my "DevOps in a Box" fantasy at yesterday's
 [DevOpsDays Austin](https://twitter.com/hashtag/devopsdaysatx?src=hash)
 openspace discussion on how to teach SREs.
 As [@ernestmueller](https://twitter.com/ernestmueller) suggested,
 ["Gang of Four" design patterns](https://en.wikipedia.org/wiki/Design_Patterns)
 could emerge, leading to an operational equivalent
 to the seminal programming book. It could be a workbench to illustrate basic
 principles and advanced new practices with metrics to record before and after
 scenarios to show impact and value.

Once enough of a prototype is established, many layers of expansion could be
 added (a number are already proposed), but some goals would include
 application lifecycle design of:

- security
  - compliance
- performance
  - resiliency/[Chaos Engineering](https://principlesofchaos.org/)
- communication (ChatOps and bots)

Yes, all of those are huge landscapes to explore of themselves!
 Then it is time to get meta: all of this should be applied to the building
 blocks of the CI/CD pipeline (the supporting system governance, health,
 failure, and operations). Of course, another expansion would be to apply all
 of the above to the host K8s cluster itself. Final expansion might be to make
 DevOps in a Box recursively hosted, tested, and ephemeral for full systems
 lifecycle management.

# Learn K8s #

Oh, and hey, let's learn Kubernetes along the way! As this effort expands,
 I'll make this a separate blog entry later.

After reviewing the [Awesome Kubernetes](https://github.com/ramitsurana/awesome-kubernetes)
 resource list, I decided to start developing with
 [MiniKube](https://kubernetes.io/docs/tasks/tools/install-minikube/)
 on my Mac with the goal to evolve understanding of
 [K8s the Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way).
 This would be the way to prototype the larger system components on my laptop.

Some research turned up possibilities to accelerate local development:

- [GitKube](https://gitkube.sh/) versus
 [a local registry](https://blog.hasura.io/sharing-a-local-registry-for-minikube-37c7240d0615)
- [Skaffold](https://github.com/GoogleContainerTools/skaffold)
- Research: https://blog.hasura.io/draft-vs-gitkube-vs-helm-vs-ksonnet-vs-metaparticle-vs-skaffold-f5aa9561f948

## Postscript: 2018-06-17

There are a number of CI/CD facilities out there worthy of some investigation:

- https://www.chef.io/automate/
  - https://docs.chef.io/workflow.html
  - https://blog.chef.io/2018/05/23/chef-automate-2-a-modern-platform-for-continuous-automation/
- https://about.gitlab.com/2017/06/29/whats-next-for-gitlab-ci/
  - https://docs.gitlab.com/ee/topics/autodevops/
