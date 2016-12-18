+++
date = "2016-03-12T15:44:02-08:00"
tags = ["declarative", "operating system"]
title = "Declarative Operating Systems"
+++

A new breed of operating systems adopt declarative configuration management for
an interesting hybrid! OS maintenance of long-lived servers remains a challenge
for our "mutable" infrastructure.
<!--more-->

Although Linux containers greatly abstract away the operating system (OS) and
can displace most of configuration management, we now see innovation on the
OS side of the equation.

## NixOS Linux ##
[NixOS Linux](http://nixos.org/) is Linux operating system distribution which
uses a declarative model for system configuration, software management, and
[remote operation](http://nixos.org/nixops/). [Nix](http://nixos.org/nix/),
the package manager, works on Mac OS and Linux, understands package dependencies,
and allows multiple versions of software to coexist, making rollback easy.
Nix works with the combination build system and Nix package repository named
[Hydra](http://nixos.org/hydra/). There is a public repository of Nix
packages, which helps complete dependencies.

An interesting proponent's opinion =
[https://www.domenkozar.com/2014/03/11/why-puppet-chef-ansible-arent-good-enough-and-we-can-do-better/]

I found a [Nix/NixOS MeetUp](https://www.meetup.com/Bay-Area-Nix-NixOS-User-Group/)
in the SF Bay Area, but the community is small. I very much admire the efforts
but had some trouble getting Hydra running on a virtual NixOS box.

## Qubes OS Project ##
[Qubes OS](https://www.qubes-os.org/tour/#what-is-qubes-os) is a "reasonably
secure operating system" for your laptop or desktop which  boots to the Xen
hyper-visor and enforces "security by compartmentalization."
Programs run inside Xen VMs for isolation from each other and inside a hardware
sandbox.
[Qubes integrates SaltStack](https://www.qubes-os.org/doc/salt/) for OS
configuration management. I found the
[Getting Started](https://www.qubes-os.org/getting-started/) section to be a
great overview of how it works!

The [Xen Project](http://xenproject.org/) has some early integration work with
[Unikernels](http://wiki.xenproject.org/wiki/Unikernels)
and [XenServer](http://xenserver.org/partners/docker.html) integrates
[Docker via APIs to a a CoreOS VM](https://xen-orchestra.com/blog/docker-support-in-xenserver-the-ultimate-guide/).

I plan to try this in my spare time, but seeing as how this blog entry took
over four months to publish, perhaps I'll hold off for another release.

## GNU GuixSD ##
[Guix System Distribution](http://www.gnu.org/software/guix/) is GNU OS that
provides a Guile Scheme API and domain specific language definitions for
package management and
[system configuration](http://www.gnu.org/software/guix/manual/html_node/System-Configuration.html).

I found this interesting, but a bit overwhelming to start diving into!

## Addendum: Further Investigations ##

There is more to investigate:

- Intel's [Clear Linux Project](https://clearlinux.org/) is distribution which
  attempts to secure and run containers with optimal performance
  on Intel hardware. Most interesting is their design goal of making [the OS
  stateless](https://clearlinux.org/features/stateless). This approach should
  be contrasted to the minimal host OSs for containers: RancherOS, CoreOS, etc.
  
- Docker's recent acquisition of [Unikernel Systems](https://blog.docker.com/2016/01/unikernel/)
  and the micro-kernel movement as a whole (http://unikernel.org/projects/)
