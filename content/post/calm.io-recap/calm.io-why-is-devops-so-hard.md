---
date: "2015-10-20T12:00:00-07:00"
tags: ['automation', 'DevOps', 'culture']
title: "Why is DevOps So Hard?"
draft: false
---
This [Calm.io blog recap](/post/calm.io-recap/)
 was originally written by me, posted on October 20, 2015 at
http://calm.io/2015/10/20/why-is-devops-so-hard/,
and slightly enhanced on February 27, 2018.
<!--more-->

For the amount of attention the term DevOps generates these days,
 there is an equal amount of difficulty encountered by many.
 After culture, the the next factor to tackle is the current state of the
 many DevOps ecosystem tools and platforms.

# An Opportune Time #

IMG: No DevOps Silos!

It is an amazing time to be involved in DevOps, there is so much innovation
 going on to advance the state of the art!

This can be seen by observing the interactions between passionate practitioners
 sharing their techniques and tooling, traditional software and service
 companies extending their products into the DevOps ecosystem, and newer
 "pure DevOps" industry players pushing their products and services forward.
 As I mentioned in my first Calm.io blog entry
 [What is DevOps?](/post/calm.io-recap/calm.io-i-dream-of-devops-but-what-is-devops/#opportunity-for-cultural-disruption)
 you should engage your local DevOps community to learn how much change is
 occurring.

However, because we are still in an early time for broad DevOps adoption,
 we see maturity problems as well.

# DevOps is Nascent #

For example, here are some questions anyone planning their next initiative
 should ask for an existing or new application:

* What cloud do I select?
* Which configuration management, build, monitoring, metrics,
  logging systems do I choose?
* How do I reuse our organization’s passwords?
* Is my DNS solution flexible enough for the immutable future?
* How do I adopt DevOps values in designing our solution?
* How do I measure DevOps success?

These questions are just the tip of the iceberg. Your organization has probably
 made selections for the cloud, tools, and systems to use, which leads to a set
 of agility questions:

* How did we choose our cloud, tools and systems?
  * If we evaluated the market today, would we choose them again?
* How easily can I change any of my choices?
  * Even with current choices, can I make a test or development instance to
  pilot changes, reproduce failures, or test upgrades?
  * Can I audit tool usage and manage scale with our choices to measure their
  effectiveness, security, and value?

If your organization did not apply a rigorous evaluation and selection process
 to your DevOps ecosystem, you are not alone, because these are still early
 days for DevOps. It is better to start the journey to DevOps and refactor
 your efforts along the way as institutional knowledge and acceptance of
 DevOps grows, but you must periodically reevaluate your efforts and realign
 them with business outcomes.

# DevOps Discipline is Lacking #

We must apply [our DevOps definition](/post/calm.io-recap/calm.io-i-dream-of-devops-but-what-is-devops/)
 to our clouds, tools, and systems of choice or suffer the consequences
 to an organization’s agility. Try it now:

> __DevOps is the *process* of removing all friction
 between the developer and customer value.__

How does your cloud, tooling, and system choices stand up to this definition
 when the developer or internal customer is your Engineering, DevOps, IT, or
 Operations teams?

Every organizational choice results in a legacy situation with constraints,
 but this underscores the cultural imperative to learn and improve for the
 future: DevOps is a cultural discipline and value that must be reapplied
 as we improve our skills, tools, and outcomes.

The following choices and phrases are warning flags indicating a legacy mindset
 needing DevOps evangelism:

* "It worked on my laptop!"
* "Keep your changes away from my code."
* "I don’t know how a change will impact production; we don’t touch production."
* "That server resource is unique/one-off/snowflake/bespoke/hand maintained
  by the ops team" = *pet infrastructure.*<sup>[1](#postscript-february-27-2018)</sup>
* "We will have to live with a single point of failure" = *pet.*<sup>[1](#postscript-february-27-2018)</sup>
* "Unconfigurable features, unrevertable changes, incompatible APIs."
* "Backups are a good enough recovery strategy."

While there may never be an ultimate solution for any of these problems,
 that should not dissuade you from the relentless pursuit of DevOps as an
 ideal state of achievement. To that end, there are many ways to evaluate
 the market of tools, platforms, and clouds as well as your own competition
 for how to achieve your DevOps journey.

My evaluation of the DevOps ecosystem leads to an unhappy conclusion.

# Most DevOps Tooling is Broken #

There are many maturity issues in the DevOps ecosystem! There are exceptions
 and evolutionary improvements all the time, but ask any DevOps practitioner
 what problems bother them. You will learn that most tools work in isolation,
 rarely integrate with others causing each to be an island of functionality,
 scalability, security, and so on.

I can break down most maturity issues into these areas:

* Clouds:
  * Can I deploy on multiple clouds or have I chosen unique APIs?
  * Should I choose public versus private or hybrid clouds for control,
   performance, security, and cost?
  * If I upgrade my private cloud infrastructure, will I have backward
   compatible APIs?
  * Do I have to choose and optimize for just one cloud, or can I be
   cloud independent?<sup>[1](#postscript-february-27-2018)</sup>
* DevOps values:
  * Do our choice of tools, platforms, and clouds enable software development
   life cycles?
    * How easy is it to make tool-dev versus tool-stage to test changes
     in configuration or operations?
    * How easy is it to make a new full development, testing, UAT, or staging
     stack/environment?
    * Can I make ephemeral stack/environments for integration testing
     during builds?
  * Do my build artifacts enable portable configuration and data use?
  * Can I make changes on the fly to production features via
   dynamic configuration management?
  * Do I know the health of my systems in production?
  * Did the latest release improve or slow response times for my key metrics?
  * Can I troubleshoot development and production problems on my laptop
   with the same set of tools?
* Enterprise ready:
  * Do all of my tools, platforms, and clouds use the same authentication
   source for users and authorization for teams, such as LDAP, Active Directory,
   SAML, or OAuth2?
  * Are my tools and platforms scalable?
    * How do they architect high availability?
    * Can I implement high availability via configuration management?
  * How do I secure my tools, platforms, and clouds?
    * Is a firewall enough now that internal attacks are possible?
    * Is authentication enough: can we implement two factor authentication?
    * How do I remove humans and manual processes entirely?<sup>[1](#postscript-february-27-2018)</sup>
    * How do I audit what happened and who did it?
    * What is the source of truth for configuration? deployments? permissions?
  * Can I throttle connections to guarantee service level agreements
   or withstand a distributed denial of service attack?

I could continue, but already you can see that we are early in the days of
 making the DevOps tooling and platform ecosystem work together and mature
 to the level we expect of the other critical systems we use to run our
 organizations.

# Postscript February 27, 2018: Pets versus Cattle #

<sup>1</sup>These are clues where I use the lens of
 "[Pets versus Cattle](http://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/)"
 to analyze a condition or problem state; I've been using it for years as part
 of my [DevOps Demystified](/post/devops_demystified.md) talk. Last year,
 I have sharpened the lens' focus to be the criterion for the business outcome
 of scalability in the
 __[DevOps Maturity Diagram](/post/devops-maturity-diagram/#scalability-removing-pets)__.
