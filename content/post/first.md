+++
date = "2015-03-06T14:11:47-08:00"
title = "Time for a new development project!"
tags = ["blog", "CMS", "static"]
+++
What does one do when laid off? You need to scratch that itch and address the things
that are in the back of your head and occasionally keep you awake at night. Technical dreams
and technical debt follow as I start my Infrastructure as Code blog.
<!--more-->

Embarking on a new adventure is always the best time in a project because all your dreams
 are possible! You research your ideas, find new tools and libraries, and smell the fresh
 scent of unhindered development.

### Then you start...

You find that your idea is broad and multifaceted, tools are in various states of acceptable
 use and documentation, and there is a bevy of dependencies: each representing a small
 landscape to conquer.

### ... to sink into reality!

The original title of this first post was "Time for a new Blog" to document my experiment
 with [Jekyll and Github Pages](http://jekyllrb.com/docs/github-pages/) before settling on
 [Hugo](http://gohugo.io/overview/introduction/): it has been a fascinating study in scope creep.

But I'm prototyping, so it's all good, right?

I'll update later with how I've navigated the static web site blog quest, thus far it has been an
 exercise in transferring most of the standard content management system functionality into
 smaller tools and libraries which inverts the work flow. I think the journey will be worth
 it because I've caught glimpses which validate this approach:

- I can blog from the command line and presumably anywhere (including my phone) with some setup.
- I can test the build of my content, templates, and enhanced work on those elements.
- Everything under revision control, therefore: blog + content = testable software!

### A Static Web CMS?

Even though I've accomplished much (including e-commerce) with various web content management systems
(CMS) such as:
 [Plone](http://plone.org/),
 [TWiki](http://twiki.org/) & [Foswiki](http://foswiki.org/),
 [Joomla](http://www.joomla.org/),
 [Drupal](http://drupal.org),
 [WordPress](http://wordpress.org),
 and [ModX](http://modx.com).
Over the years, you inevitably fall *out of love* after the first month with complex and brittle software
when you extend it into the enterprise by adding integrations, plugins, etc. which have their own security
attack surface, dependencies, update schedule, and incompatibilities.

You wonder if Share Point is just as evil (I'm sure it is!) and will I fall out of love with a static CMS?

This is not a unique problem, it is shared by many other classes of software (like Jenkins, JIRA,
and your web browser) and once you extend any API or customize any work flow (Oracle EBS). It is
an indication of richness, complexity, and technical debt.

A static, compiled web site removes and loses dynamic, server-side functionality for persistence and
interaction, or does it? With the advent of application service providers (ASP) or cloud hosted
anything-as-a-service, we can move from server-side to service providers for authentication, spam filtered
comments, forms and polls, advertising, analytics, and who knows what else?
In addition, we can leverage improved web client capabilities to shift what was server-side to client-side processing.

This will be a great experiment!

### Infrastructure as Code

The real purpose of this blog will be to catalog and share my research and development towards my passion:
Infrastructure as Code which will lead to my dream of behavior driven DevOps. It is a ripe time for
system and design thinking because the entire industry is trying to solve basic problems and automate
solutions while integrating many different systems and disciplines. It is an exciting and disruptive time!
