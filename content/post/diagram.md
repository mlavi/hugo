+++
date = "2015-03-10T23:16:27-07:00"
tags = ["automation", "diagram", "DevOps"]
title = "A DevOps Automation State Diagram"
+++

Two wonderful things today:

- I found exactly the tool I have been looking for over the years!
  I used Wikipedia and [alternativeTo](http://alternativeto.net) to survey the market for competitors
  to my favorite open source object drawing tool, [Dia](https://wiki.gnome.org/Apps/Dia).

- The following snapshot shows authoring the work-in-progress...
  ![DevOps Automation Diagram](/img/devops-automation-screenshot.png)

The DevOps mission of reducing friction between the developer's code and deployment to production
is mostly captured by this diagram. It has been in my head for a while, extended past but based on
work with my colleagues at Pertino. It is mostly complete, a bit of an eye-chart, and I want to
improve the flow by reducing crossing lines. Working on this as a state diagram has yielded some
insight into improvements, optimization, and bottlenecks. I plan to release the source file as part
of my infrastructure as code project.

I made it with [PlantUML in Eclipse with GraphViz](http://www.plantuml.com/eclipse.html) with a view
rendering the results on the fly (no need to save) which felt like unit testing my diagram!
This allowed me to iterate frequently with text rather than graphics: brilliant and yet
another example as infrastructure as code. :~) My standby object drawing program, Dia,
would have done the trick as well, perhaps even better from a layout crossing lines perspective,
but re-factoring would have been slower. Re-factoring was key in making improvements and I could
perform analysis on my arrow layout hints, e.g.: <code>$ grep '-->' | wc --lines</code>

I'll update with the final product soon: you will be able to view the SVG image in a new browser
window or tab, then scale it to your liking. I'm very happy with the results of performing this work
with open source software and formats (currently 45Kb SVG which allows you to copy the text of the
diagram) for flexibility and performance.
