---
tags: ['developer', 'maturity']
draft: true
date: "2021-03-17T06:23:40-05:00"
title: "Developer Maturity"
---
The search for the mythical 100x developer is good thought material. A pragmatic approach for finding good developers would be to define the strategic characteristics of bad and good developers for evaluation. I believe that by default, we are bad developers at the start of every project, the goal is to minimize immaturity and work to improve maturity.<!--more-->

# Bad Developers

Before anyone is offended, please remember that I believe I suffer from bad characteristics at the beginning of every project. In fact, I contend that everyone does this, so we must acknowledge the maturity state if we are to recognize and progressively address developer maturity.

Bad developers work:

- Solo (alone)
  - Unreproducible work = it works on my snowflake laptop (only)
- Without revision control:
  - Operators need to adopt this habit, for software engineers this should not be an issue.
  - infrequent revision control updates
    i.e.: after each goal achieved, performs a commit.
    - I would consider a commit per day of work a minimum.
  - infrequent sync from centralized repository
    - i.e.: git pull and git push each day of work?
- Increase technical debt:
  - Hard coded values in code
    - i.e.: pets, or non-portable code
  - Without tests
  - Without instrumentation: logs and metrics
  - Without documentation
  - Manually
    - i.e.: no automation for build, test, deploy, monitor
- Without process:
  - coding standards
  - basic work management:
    - goals
    - issue tracker
    - Kanban, other agile practices
- Resist change in work habits

# Good Developers

Good developers work to reverse bad characteristics, plus:

- Seek to increase collaboration, adoption:
  - On their team
  - In their org (innersource)
  - Outside their org (open source)
  - Extraverts promote on social media
- Seek to reduce technical debt:
  - Refactor processes to derive from primary materials (everything as code, GitOps)
    - Refactoring work to remove pets
      - Dynamic configuration
      - Don't repeat yourself (DRY): move to libraries or reuse frameworks and libraries
    - Improving documentation
    - Increasing automation and instrumentation
- Seek to improve engineering:
  - Share relevant books, articles, blogs, developments of interest
  - Share learning and experience
  - Reduce toil in engineering process for standards and management
  - Senior: Evaluate code performance, cycle times, uptime, quality, instrumentation cleanliness/ergometrics, KPI/OKR dashboards
  - Senior: mentor and pair program
  - Senior: reverse archaic traditions, remove extraneous guardrails, drive towards behavior driven development
