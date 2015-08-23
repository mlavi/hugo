+++
date = "2015-04-04T07:55:39-07:00"
tags = ["heavy", "container", "immutable", "infrastructure", "configuration"]
title = "Container Infrastructure Strategy"
+++

In these early years of containers, "heavy containers" represent a typical approach which
resembles virtual machines, includes the operating system user land, and desires configuration
management. Does this starting point represent the opposite of container promise and the journey
to immutable infrastructure?
<!--more-->

### Update: 2015-08-20 ###

The content of this blog post has been given as a talk:

- 2015-08-19: presented at [Advanced AWS Meetup](http://www.meetup.com/AdvancedAWS/events/223822846/)
  hosted by New Relic, San Francisco, CA
    - Slides: [DevOps and Heavy Containers](/slides/container-infrastructure-strategy.html) || [Markdown](/slides/container-infrastructure-strategy.md)
- 2015-05-16: presented at [RootConf 2015](https://rootconf.talkfunnel.com/2015/62-container-infrastructure-strategy)
  Bangalore, India.
    - One valuable comment from the audience: the separation of responsibilities which can imply container
 layers resembles [OSGi architecture](https://en.wikipedia.org/wiki/OSGi#Architecture).
 I think this is a great way to look at things!
- 2015-04-28: presented to the technical staff of [TicketFly](http://www.ticketfly.com/about-us) at the invitation of Jerome, Director of Technology.
- 2015-04-16: led the open space session at the Container Unconference, preceding [Container Camp @ San Francisco 2015](https://container.camp/sf-2015/).

### Heavy Containers

I have been researching containers for years, I encountered [an early mention for Drupal CMS hosting]
(https://pantheon.io/blog/why-we-built-pantheon-containers-instead-virtual-machines)
 probably a year before I heard about Docker. I had worked with
 [chroot jails](https://en.wikipedia.org/wiki/Chroot) earlier in my career,
 but [Docker](http://docker.com) made LXC containers easy to use, just as [Vagrant](http://vagrantup.com)
 had done for Virtual Machines.

For the sake of simplifying this discussion, I will not discuss dynamic run time configuration: it is the
subject of a future blog post. We will approximate it via static application configuration in the example.

An ideal container holds an application and nothing more: the tricky part is defining your application
and its dependencies. If you look at the full technology stack that supports an application, you would consider
the data, code, run time configuration, server facility, and further dependencies. e.g.:

* application:
  * code: /var/www/virtualhost.example.com/micro/service/route
  * libraries and frameworks: /var/www/shared/language/framework-version (potentially implicitly stored with the code base)
  * static configuration data: /var/www/shared/configuration/databasepassword.inc.txt (potentially implicitly stored with the code base)
* run time: (e.g.: PHP)
  * binaries: /usr/bin/local/php-5.x
  * configuration: /etc/php.ini
  * library dependencies: openssl, etc.
* server: (e.g.: Apache-2.4.x)
  * binaries: /usr/bin/local/apache2**
  * configuration: /etc/apache2/**
  * run time configuration: /etc/defaults/apache2
  * startup customization: /etc/init/apache2-custom
  * plug-ins: mod_php, mod_ssl, etc.
  * plug-in dependencies: openssl, php, etc.

It is desirable to bundle all of these things together as a full stack into a static deployment unit,
making your application portable and self-contained (ha ha).
There is a challenge to decide container scope because of the natural tendency
to follow the dependencies and bundle everything into the container, which weighs it down.

The initial practice many use for their container is a full
Linux operating system distribution, which I call a "heavy container," because it contains
everything and resembles an entire virtual machine (VM):

	$ grep -e FROM -e RUN Dockerfile
	FROM ubuntu:14.04.2
	RUN apt-get update && apt-get install -y apache2 php5

This scope (equivalent to a VM) is natural until you are comfortable with containers,
 then you are ready for container re-factoring and layering. There is a notion of linked
 and data containers which I'll explore later, but what would we re-factor and why?

### Container Re-factoring

This is an incomplete thought: I will continue to organize and expand it.

Any solution must properly address the audience. For developers, a development container might have everything
needed for production but also add troubleshooting and development tools. For production, we would use the
lighter version of the developer container by omitting the developer extras, this minimizes the difference between dev and prod!

We can accomplish this by separating containers into layers, where each
[container layer](http://docs.docker.com/terms/layer/) is a container unto itself and
[they can be added together](http://docs.docker.com/reference/builder/#from) to **compose** a bigger container.

Therefore, each container layer could represent an area of expertise which models how your organization
manages resources and could progress with a different development cadence. e.g.:

* your system administrators might take care of the base OS,
* your network team might address firewall and networking concerns,
* your server developer team might take care of the server run time and dependencies,
* your DevOps team could address configuration, etc.
* your developers address the application and dependencies.

Reusing the expertise in your organization suggests a good starting model
and allows independent iteration of each concern by container layer.

The result is a robust container build that dynamically invokes its dependent layers, allowing each
to iterate as needed, reducing complexity for a single, monolithic build and risk for rapid deployment.

So let's explore this idea in more detail:

* FROM minimalist/OS

Because every guest container resides on a container host, which is an area of OS refactoring
and innovation as they are optimized to run containers (i.e.: boot to container):

* [CoreOS](http://coreos.com/)
* [Project Atomic](http://www.projectatomic.io/docs/introduction/) by RedHat
* [RancherOS](http://rancher.com/rancher-os/)
* 'Snappy' [Ubuntu Core](http://www.ubuntu.com/cloud/tools/snappy)
* All modern Linux distributions are the default candidates for container hosting in development

refactoring should take into account both the container host (above)
and the container run time facilities (below):

* [Docker engine](https://www.docker.com/docker-engine)
* [CoreOS rkt](https://coreos.com/rkt/docs/latest/)
* [sytemd-nspawn](http://www.freedesktop.org/software/systemd/man/systemd-nspawn.html)
* [LXC/LXD](https://linuxcontainers.org/)

This becomes interesting if you've picked a minimal Linux distribution as a base for your
container, such as:

* [Alpine](https://hub.docker.com/_/alpine/)
* [Baseimage-docker](http://phusion.github.io/baseimage-docker/)
* [Passenger-docker](https://github.com/phusion/passenger-docker#why_use)
* etc.

because they are stripped down and a better starting point than a full OS,
but perhaps entirely unnecessary depending on your container host and container run time.

This is a clue that we shouldn't need to bind a full operating system user land (or kernel)
into our containers. Developing your first containers with sshd and more is where you start
the container journey, but not where you should end.

* FROM server/facility
* FROM server/runtime

Because your server facility or run time typically do not change unless there is a new release
which contains a security, performance, or feature fix, this is the next candidate for removal
from a monolithic, full OS based container and should be refactored to its own container layer.
This likely includes the server dependencies (libraries and other run-times).

However, the run-time configuration of this server facility could be dynamic
so I would consider that data and a layer closer to the application. In fact, it would be
ideal to make dynamic run-time configuration a service and pull it out of the 
container entirely, allowing you to reuse this container for all stacks.

The idea is that the server facility is a separate layer from our application: it iterates
on a different time line and it is an infrastructure engineer concern most likely,
so why would one weigh down an application container layer with it?

* FROM operations/facilities

Facilities such as distributed or centralized logging, metrics, and monitoring are external
to the application. They may be comprised of libraries, frameworks, clients, and their configuration.
These services which could reside many places, such as: on the container host, a service external
to the container host, in another container on the same host, or in another container layer.

* FROM developer/tools

Editors, compilers, debuggers, and other diagnostic, utility, and troubleshooting tools
and facilities such as SSH, local logging, metrics, and monitoring are also heavy items
and external to the application, so they should be refactored into their own container layer.

* FROM application/microserviceX

Finally, we arrive at the actual code base: this can iterate on its own time line,
triggering a full container rebuild and deployment. Fortunately, each container
layer may be cached, minimizing build time!

The application has dependencies such as runtime configuration and libraries.
Potentially, those can be externalized from the application to their own container
layer which iterates on a separate time line.

Summary: I would advocate that we compose all of these layers during container build time versus the
typical approach we use the first time we build a container with Docker: using RUN to shell out
and perform installation and configuration tasks.

[This idea was introduced](https://www.youtube.com/watch?v=M9hBsRUeRdg)
at the [CoreOS Meetup](http://www.meetup.com/coreos/events/215452012/)
by James Russell, DevOps engineer at Sony Computer Entertainment America, DevNet Team.
It has been further explored in a talk called
"Exploring Strategies for Minimal Containerization" by Brian "Red Beard" Harrington,
Principal Architect at CoreOS, but I only found
[a partial reference](https://www.youtube.com/watch?v=P3sO9URqOhE)
at a recent Container Days keynote. Redbeard has polished his talk brilliantly now,
[Getting Weird with Containers](https://www.youtube.com/watch?v=gMpldbcMHuI).
The biggest aha moment for me was omitting the kernel, but that is obvious in hindsight.

**Most use of RUN represents a duplication of effort that I abhor:**
[because configuration by shell is something we have done before](/post/build-lamp-stack-with-phing/#migration-of-build-methods:1d44784f593e898273702c2689a01985)
as a first level approximation problem solution. Many of us now use configuration management,
which is a field comprised of tools known as Ansible, CF Engine, Chef, Puppet, Salt, and more.

However, configuration management is typically invoked after deployment of a resource during run-time,
but Dockerfiles are invoked in the build domain. I have been exploring this strategic gap between the
VM and the container for months without resolution. I went to ChefConf 2015 and asked this question
but didn't find an answer because I think there is a fundamental divide
between immutable infrastructure (of ephemeral containers, called cattle)
and configuration management of persistent infrastructure (which is longer lived, called pets).
This is an example of the [pets versus cattle](https://news.ycombinator.com/item?id=7311704) discussion,
which is an upshot of infrastructure as code adoption to reduce snowflake, bespoke, hand maintained infrastructure.

- Configuration management of a container host, that makes sense to me.
- Configuration management inside a container guest, that is a heavy container (and doesn't make
ultimate sense to me).
- Configuration management to build a container, that makes sense to me, *but I haven't found it
yet.*

Reusing our configuration management code so we can use it to build a container or a VM makes sense.

Could it be as simple as:

* RUN puppet agent apply
* RUN chef-solo -c ~/solo.rb -j ~/node.json
* etc?

### Immutable Infrastructure versus Configuration Management: build-time versus run-time

I want to reuse my configuration management to build a container rather than use shell
commands which represent the lowest level primitive of configuration management functionality.

One of the benefits of configuration management is that you perform periodic runs
to sync and update configuration, allowing drift correction and auditing of the configured system.
This implies a longer-lived, persistent system and we find that the "heavier" the system is,
the more useful this model becomes to maintain run state.

If a system is immutable, constrained to an application code artifact, and continuously deployed
thousands of times a day -- do we need configuration management sync and updates? I like configuration
management to be used during build time for artifacts and only as an option during run-time of those artifacts.
I arrived at this viewpoint recently during a discussion with HashiCorp's CTO, Armon Dadgar, because
it is exactly the use case established with Vagrant to develop and test your configuration management,
but then use [Packer to build your container artifact](https://packer.io/docs/builders/docker.html).

It appears this approach is also endorsed by
[Ansible](http://www.ansible.com/blog/ansible-and-containers-why-and-how) and
[Chef](https://docs.chef.io/containers.html),
[Chef Slides](http://www.slideshare.net/mpgoetz/packing-it-in-images-containers-and-config-management-37015676)
while potentially supported by [Puppet](https://puppetlabs.com/blog/simplify-managing-docker-puppet)
and [SaltStack](http://saltstack.com/saltstack-delivers-more-automation-docker-lxc-application-containers/),
but I think we can say this needs some more thought and evangelism because our entire
community is wrestling with this problem as we transition to understand containers, e.g.:
R.I. Pienaar (author of Marionette Collective, MCo, which is bundled with Puppet)
wrote about [Moving a service from Puppet to Docker]
(https://www.devco.net/archives/2015/02/24/moving-a-service-from-puppet-to-docker-2.php).

### Container Deployment and Orchestration

Container deployment and orchestration becomes the next issue: do you use a scheduler like
[Apache Mesos](http://mesos.apache.org/), [Google Kubernetes](http://kubernetes.io/),
or a tool like [Terraform](http://terraform.io) to inform your load balancer, DNS, monitoring,
and service discovery and dynamic configuration management systems that a tested official build
artifact is ready to deploy? This is an area where configuration management does not suffice
unless you have an external source driving it.

Containers in production are easy to deploy when used for single tier applications which
are immutable and hopefully modeled as a micro-service (see the
[Twelve-Factor App](http://12factor.net/), but this application model certainly *does not*
fit all sizes.

Application deployments becomes easier if you leverage the HTTP model of web browsers and servers
using capability negotiation and redirects between coexisting different versions of your API
services (which would be necessary when you do not design forward and backward compatible APIs
or database schemas). More thought exists for application and system design in the
[Reactive Manifesto](http://www.reactivemanifesto.org/).

The roll out of an entire service upgrade is a complex orchestration exercise.
It represents a medley of service and application operations along with persistent
data sources and it is a higher level problem I want to tackle soon. My dream is
to work toward test driven DevOps and behavior driven DevOps to accomplish this.
