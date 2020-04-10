+++
date = "2015-03-06T14:11:47-08:00"
title = "Time for a new development project!"
tags = ["about", "CMS", "infrastructure"]
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
 with [Jekyll and GitHub Pages](http://jekyllrb.com/docs/github-pages/) before settling on
 [Hugo](http://gohugo.io/overview/introduction/): it has been a fascinating study in scope creep.
But I'm prototyping, so it's all good, right?

Recently, I discovered [MkDocs](http://www.mkdocs.org/) for "Project documentation with Markdown."
 I started to navigating the static web site blog quest, it was an
 exercise in transferring most of the standard content management system functionality into
 smaller tools and libraries which inverts the work flow from typing content into a WYSIWYG
 form-based editor to add formatting to simple markdown during writing.
 I think the journey was worth it because I caught glimpses which validate this efficient approach:

- I can blog from the command line and presumably anywhere (including my phone) with some setup.
- I can test the build of my content, templates, and enhanced work on those elements.
- Everything under revision control, therefore blog + content = testable software!

### A Static Web CMS?

Even though I've accomplished much (including e-commerce) with various web content management systems
(CMS) such as:
 [Plone](http://plone.org/),
 [TWiki](http://twiki.org/) & [Foswiki](http://foswiki.org/),
 [Joomla](http://www.joomla.org/),
 [Drupal](http://drupal.org),
 [WordPress](http://wordpress.org),
 and [ModX](http://modx.com).
over the years, you inevitably fall *out of love* with them after the first month. You discover a
landscape of complex and brittle software when you extend a web CMS into the enterprise by adding
integrations, plugins, etc. which have their own security attack surface, dependencies, update schedule,
and incompatibilities.

You wonder if Share Point and Alfresco are just as evil (I am sure they are) and
so you wonder if you will also inevitably fall out of love with a static CMS?

This is not a unique problem, it is shared by many other classes of software (like Jenkins, JIRA,
and your web browser) once you extend any API or customize a work flow (Oracle EBS). It is
an indication of rich platform, ecosystem, or framework, but every customization leads to
increased complexity and technical debt.

A static, compiled web site loses dynamic, server-side functionality for persistence and
interaction, or does it? With the advent of application service providers (ASP) or cloud hosted
anything-as-a-service, we can move from server-side to service providers for authentication, spam filtered
comments, forms and polls, advertising, analytics, and who knows what else?
In addition, we can leverage improved web client capabilities to shift what was server-side to client-side processing.

This will be a great experiment!

### Infrastructure as Code

The real purpose of this blog will be to catalog and share my research and development towards my passion:
*Infrastructure as Code* which will lead to my dream of *behavior driven DevOps.*
 It is a ripe time for system and design thinking because the entire industry
 is trying to solve basic problems and automate solutions while integrating many
 different systems and disciplines. It is an exciting and disruptive time!

## Postscript: 2018-05-21 ##

I have to say, I enjoy a static web CMS under version control with simple deployment testing!
Hugo has been pretty great, but I'm curious about https://nanoc.ws/ now.

## Postscript: 2018-06-15 ##

The EU GDPR: [General Data Protection Regulation](https://www.eugdpr.org/) and
 audience comments as a service Disqus injecting ads has caused a general
 re-evaluation of static web sites and dynamic comments. Some research needed:

- https://montyflatts.com/mission-blog-comments/
- https://stiobhart.net/2017-02-24-isso-comments/
- https://www.vis4.net/blog/2017/10/hello-schnack/
- https://coralproject.net/talk/
- https://github.com/vkuznecovas/mouthful
- https://staticman.net/
Self hosted, open source alternatives (from https://gohugo.io/content-management/comments/):
- https://github.com/umputun/remark
- https://utteranc.es/ (uses GitHub issues)
- https://posativ.org/isso/docs/
- https://github.com/debiki/talkyard-prod-one

## Postscript: 2020-04-10 ##

Time to investigate https://jamstack.org/best-practices and https://jamstack.wtf/, I like the principles of the project.
