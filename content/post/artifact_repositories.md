+++
date = "2015-08-26T08:59:59-07:00"
tags = ["artifact", "build", 'distribution',]
title = 'Artifact Repositories'

+++

<!--more-->
### Ship the Bits

Once upon a time, software release management was as simple as performing a desktop build, 
uploading the results to a FTP server, updating the web site, and sending an email.

Software repositories can be that simple, but the state of the art has advanced to support
secure deployments for continuous delivery to multiple clusters in data centers around the
world multiple times per hour!

### Release Management

There are many considerations for release management today, assuming that our build candidate
has passed all of the required tests to become an official release. Now that we pursue
infrastructure as code, we also build and deploy our software as infrastructure artifacts.

The simple monolithic build of static code and library dependencies has transitioned into
a collection of multiple versioned artifacts which must be integrated and configured as a
system even before considering the deployment permutation matrix of multiple hardware,
OS platform, and client versions. Considerations include:

* Build Post Processing:
  * compression into a one file archive to save bandwidth
  * different editions (subsets of the build if they are not handled as separates)
  * check sums and code signing
  * packaging:
    * metadata for each OS or runtime
    * versus bundling an installer as a self extracting executable
  * documentation
  * licensing and potentially providing source code
  * third party licensing
  * purging old artifacts, build, and test logs
* Distribution:
  * channels for automatic updates
  * artifact repositories versus file servers
  * caches, mirrors, and content/artifact delivery networks
  * privileged versus public official releases
  * private, internal release candidates for testing
  * metrics and logs: download counts and bandwidth constraints

### Naming the Artifact and Useful Metadata

Surely naming the artifact should be straightforward if we can answer some basic questions,
such as: do we have file naming conventions and are build, version, and release numbers the same thing?

You would be surprised how often the answer is... it depends!
However, there are guidelines you can adopt:

* [Software Versioning](https://en.wikipedia.org/wiki/Software_versioning) at Wikipedia
* [Semantic Versioning](http://semver.org/)

While many software package formats specify the metadata requirements, a few have standardized
on [DOAP: Description of a Project](https://github.com/edumbill/doap/wiki).

### Software Artifact Repositories

[Feature Matrix of Archiva, Artifactory, Maven](http://binary-repositories-comparison.github.io/)

While an engineering organization produces build artifacts, they often bundle other third
party open or closed source libraries. In order to speed manual developer builds and automated
build systems, these external resources can be cached to increase build speed, reliability, and
conserve upstream network bandwidth.

While each language may have it's own packaging format for build artifacts, e.g.:

* Java: .jar, .war, and .ear
* JavaScript: .npm
* PERL: CPAN modules are compressed tarballs
* PHP: .phar
* Python: .egg, .whl
* Ruby: .gem

We also have operating system package management:

* RedHat, Fedora, CentOS and related derivatives: .rpm format with yum repositories
* Debian, Ubuntu, and related derivatives: .deb format with apt repositories and Launchpad PPA

And now we have public and private container repositories as hosted services or private deployments:

* [Docker Hub](https://hub.docker.com/)
* [Quay.io](https://quay.io/) and [CoreOS Enterprise Registry](https://coreos.com/products/enterprise-registry/)

Along with Vagrant box hosting:

* [Atlas](https://atlas.hashicorp.com/search/)
* [VagrantBox.es](http://www.vagrantbox.es/)
* JFrog's Bintray and Artifactory (see below)

Caveat Emptor: downloading and installing any artifact from the Internet is potential for malware,
virus, and other abuse unless you know, trust, and verify the source.

Personally, I've had very good experience with [JFrog's Artifactory](http://www.jfrog.com/open-source/),
which is a meta repository of many different formats, but you will probably outgrow
the open source version when you need to handle authentication and some of the formats mentioned above,
so the SaaS subscription may be a better option.

### Software Distribution Networks

These are specific to build artifacts, however they can be considered a special case
of content delivery networks such as Akami, [CacheFly](https://cachefly.com), and Fastly
as well as related to content accelerators such as CloudFlare
 and Amazon [CloudFront](https://aws.amazon.com/cloudfront/)

* JFrog's [Bintray](https://bintray.com)
* [SourceForge](http://sf.net)
* JavaScript:
  * [CDNJS](https://cdnjs.com/about)
  * [jsDelivr](http://www.jsdelivr.com/)

One potentially biased resource gives a good overview of the market [http://www.cdnplanet.com/]
