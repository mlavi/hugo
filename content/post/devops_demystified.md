+++
date = "2015-10-13T12:03:32-07:00"
tags = ["devops", "definition", "culture"]
title = "DevOps Demystified"

+++
For a term that is not even six years old, DevOps remains a mysterious pursuit
 for many software engineering organizations. Let me define DevOps to help you
 understand and chart your own journey. *Hint:* it is a cultural term!
<!--more-->
### Update: 2016-12-17

Yet another refactoring and updates with expanded citations, leveraging a bit of
my last four months of DevOps evangelism for Nutanix across five countries. It
could use more more work!

### Update: 2015-11-18

I have polished and reorganized the slides a few times to improve the flow, reinforce,
 and elaborate on key points. I am happy to give this talk to any organization
 and I have provided the slides for your evangelism efforts as well!
Please contact me with any follow up questions or comments.

### Abstract

A brief history of the DevOps movement and community with a cross section view of many methods
and practices that are breaking down the barriers to achieve engineering agility.
DevOps seems intangible: you can't buy it, there is no certification, and frankly, there is no
universal definition, yet everyone wants it or already "does" it, but still has trouble
identifying it.
I will cover many topics so that you can understand and chart your journey to DevOps.

### Agenda

 - A Definition and Cultural Rendering of DevOps
     - A Brief History of DevOps
     - DevOps Impact on Organizations
 - The Journey to DevOps
     - Agile Infrastructure in the Cloud
     - Infrastructure as Code
     - Pets versus Cattle versus Bacteria
     - Test, Build, Deploy Pattern
     - Infrastructure Orchestration and Models
 - Epilogue: BusinessOps
     - We are all DevOps: your call to action!

### DevOps Definition

DevOps is the *process* of removing all friction between the developer and customer value.

However, DevOps is a culturally rendered term: it is practiced by people and dynamically bound
to their capabilities.

Elaboration: [I Dream of DevOps, but What is DevOps?](/post/calm.io-recap/calm.io-i-dream-of-devops-but-what-is-devops/)

### Presentation

- Slides: [DevOps Demystified](/slides/devops-demystified.html) || [Markdown](/slides/devops-demystified.md)

The actual content of this blog post has been given as a talk:

- 2016-12-17: presented at [Cloud Computing Basics](https://www.meetup.com/Cloud-Computing-Basics/events/234108925/)
    - Online presentation captured and uploaded to [YouTube](https://www.youtube.com/watch?v=7WBEhtQssn8):

<iframe width="640" height="360" src="https://www.youtube.com/embed/7WBEhtQssn8" frameborder="0" allowfullscreen></iframe>

- 2015-11-17: presented at [AWS Bay Area Meetup](http://www.meetup.com/awsgurus/events/226547082/)
    - Typical Meetup attrition: 75 registered, 25+ attended.
    - DevOps definition suggestions:
        - Change "remove friction" to "increase collaboration."
            - It is close to being the flip side of the same coin, but does not allow a clean notion of recursion and application to tools.
        - Drop the word "value."
            - I considered this, but the definition becomes too abstract: value yields tangible and measurable properties.
    - Tweets ensued:

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">RT <a href="https://twitter.com/raravena80">@raravena80</a>: Awesome Meetup at <a href="https://twitter.com/Coupa">@Coupa</a> HQ with <a href="https://twitter.com/calm_mark">@calm_mark</a> !! <a href="https://t.co/5kljKrreD3">pic.twitter.com/5kljKrreD3</a></p>&mdash; Coupa Software (@Coupa) <a href="https://twitter.com/Coupa/status/666818169798021120">November 18, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

- 2015-10-03: presented at [Silicon Valley Code Camp 2015](https://www.siliconvalley-codecamp.com/Session/2015/demystifying-devops)
    - Nice turnout of 13 registered, 85 interested, and about 40 attendees.
    - Tweets ensued:

<blockquote class="twitter-tweet" lang="en"><p lang="en" dir="ltr">&quot;DevOps is a culturally rendered term.&quot; <a href="https://twitter.com/calm_mark">@calm_mark</a></p>&mdash; Noah Kantrowitz (@kantrn) <a href="https://twitter.com/kantrn/status/650414900682973184">October 3, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

## Additional Links ##

Although there are no citations for [@Gortees](http://blog.jgriffiths.org/)'s work or images, which I find lacking in academic and ethical values, I do admire his presentation #24 at [SpiceWorld 2018](https://spiceworks.hubs.vidyard.com/watch/5s2nNbixLaS4NF5bdJvuFJ?) = "Why is Automation So Hard?" He charts the progression of automation with automative manufacturing from Ford to Toyota to illustrate DevOps parallels. However, the Toyota Production System is frequently cited by many of my DevOps colleagues, so I would like to encourage him to improve his ethics for the future.
