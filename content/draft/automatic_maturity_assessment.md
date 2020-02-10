tags: ['Maturity']
draft: true
date: "2020-02-09T16:29:10-06:00"
title: "Automated Maturity Assessment"
---

# Notes From JenkinsWorld 2019 SF, Salesforce talk

- What does good look like?
  - Categorize criteria: building vs. deployment vs testing vs reporting
  - 5 expertise levels: base, beginner, Intermediate, Advanced, Experts: show org examples
- Team CI/CD adoption:
  - At SFDC.com, of 90 scrum teams, over 7 domains, 30 have adopted in first six months: asked the Product Owner, Team Lead, etc.
- Assessment:
  - 35% Jenkins
    - unit test coverage, security vulnerable code base, functional test code coverage
    - scrum team information/metrics
    - traverse folders or Jenkins view of all jobs, pull job stats XML, map against team
  - 65% 5-10min questionnaire = 40 Q via GOOG forms; stored in analytics/BI
    - Do you use feature flags, % of functional tests automated, have you done devsec 101?
  Composite metric reported over time every quarter?
  Report with metric and largest failed questions becomes top ranked improvement tip.

Be transparent with questions and scoring; team should only compare similar; this is informative, not punitive
Get management to assist in adoption.
Over time, questions may be added or change, scoring may be tweaked
