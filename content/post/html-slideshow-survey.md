---
date: "2015-04-23T12:59:26-07:00"
tags: ["HTML", "slide", "web"]
title: "HTML Slide Show Survey"
---

PowerPoint and other proprietary slide-ware, bah!
We already have a universal, open system for communication
called the web, so let's explore web presentation applications.
<!--more-->
### Survey Says...

We used dynamic HTML slides at Netscape for our DevCon presentations, it was time to see what
the state of the art was today! I had encountered a few solutions over the years, but I found
exhaustive lists on http://alternativeto.net/software/microsoft-powerpoint/
and http://alternativeto.net/software/prezi/

I was instantly productive with Landslide running in a Python virtualenv with a watchdog script
for recompiling my updates in Markdown, so I chose that, but I would revisit any of the following.

### Static Tools

These HTML slide systems are comprised of static HTML+CSS+JavaScript in which you author content directly.

  * Biggie: [Source](http://github.com/tmcw/big/)
    || [Demo](http://www.macwright.org/biggie/) author in Markdown, interesting forks!
  * CSSS: [Source](https://github.com/LeaVerou/CSSS)
    || [Demo](http://leaverou.github.io/CSSS/)
    || [BlogPost](http://lea.verou.me/2010/10/my-ft2010-slides-and-csss-my-presentation-framework/)
  * Deck.js: [Source](https://github.com/imakewebthings/deck.js)
    || [Demo](http://imakewebthings.com/deck.js)
  * Flowtime.js: [Source](https://github.com/marcolago/flowtime.js)
    || [Demo](http://flowtime-js.marcolago.com) 2D HUD FTW!
  * Scrolldeck.js: [Demo](http://johnpolacek.github.io/scrolldeck.js)
  * Shower: [Source](https://github.com/shower/shower)
    || [Demo](http://shwr.me)
  * Stack: [Source](https://github.com/mbostock/stack/)
    || [Demo](https://mbostock.github.io/stack/)

### Dynamic Tools

These HTML slide packages require compiling, but final output is static HTML+CSS+JavaScript:

  * Slippy: [Source](https://github.com/Seldaek/slippy/)
    || [Demo](http://slides.seld.be/?file=2010-05-30+Example.html#1)
  * Impress.js: [Source](https://github.com/impress/impress.js)
    || [Demo](http://impress.github.io/impress.js)
    can reproduce Prezi canvas like zooming 2D effects and animations.
      * Hekyll: [Source](https://github.com/bmcmurray/hekyll)
        || [Demo](http://bmcmurray.github.io/hekyll/preso.htm)
        author in Markdown, compile to Impress.js
      * jmpress.js: [Source](https://github.com/jmpressjs/impress.js)
        || [Demo](http://jmpressjs.github.io/jmpress.js) fork of Impress.js using jQuery
  * Slides: [Source](https://github.com/briancavalier/slides)
    || [Demo](http://briancavalier.com/code/slides)
    npm install
  * Reveal.js: [Source](https://github.com/hakimel/reveal.js)
    || [Demo](http://lab.hakim.se/reveal-js/): promotes a paid visual editor site
  * Landslide: [Source](https://github.com/adamzap/landslide)
    PyPi: pip install. Compiled slides to PDF export as well!
  * Slide Show (S9): [Home](http://slideshow-s9.github.io): Ruby gem
  * Google I/O-Slides: [Home](https://code.google.com/p/io-2012-slides/)
  * Bespoke.js: [Source](https://github.com/markdalgleish/bespoke.js)
    || [Demo](http://markdalgleish.com/projects/bespoke.js/) leverages Yeoman, Grunt, etc.

### Other Open Formats

I found some interesting alternate formats for SVG and PDF Slides, a la Prezi:

  * Pres/v/g: [Source](https://github.com/feklee/presvg)
    || [Demo](http://feklee.github.com/presvg/demo.html)
  * PDFCube: [Home](http://code.100allora.it/pdfcube/) || [Source](https://github.com/baol/pdfcube)
