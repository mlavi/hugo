Installed:
- Grub Customizer:
  - https://launchpad.net/~danielrichter2007/+archive/ubuntu/grub-customizer
  - ````sudo add-apt-repository ppa:danielrichter2007/grub-customizer \
    && sudo apt-get update && sudo apt-get install grub-customizer \
    && sudo grub-customizer````
- Software Manager:
  - meld chromium-browser nemo-terminal
  - bluetooth^manager
- sudo apt-get update && sudo apt-get install git tree
- sudo apt install snapd && sudo snap install slack --classic
- See: Atom with Dotfiles+Shell+CLI acceleration/research=blog/atom.md
- Desktop launcher for: Atom, Slack, Meld
- Add to Firefox:
  - Theme
  - Add-on
- Screen magnification:
  - System Settings > Accessibility > visual
  - Desktop Zoom: Enable
  - I like all defaults: ALT+Mouse scroll
- System Settings > Applets
  - Accessibility
  - On-Screen keyboard
  - Workspace name
  - ?
    - Recent Documents
  - Downloadable:
    - Spices update
    - System Monitor
    - Redshift
    - ? Graphical HW Monitor: sudo apt install gir1.2-gtop-2.0
    - ? Drawer
- Blue light filter
  - https://alternativeto.net/software/blue-light-filter-for-eye-care/?platform=linux
  - https://justgetflux.com/linux.html
    - ````sudo add-apt-repository ppa:nathan-renniewaldock/flux \
      && sudo apt-get update && sudo apt-get -y install fluxgui````
    - not seeing anything after setting city via fluxgui (appears as applet)
    - sudo apt-get remove fluxgui #no xflux!
  - http://jonls.dk/redshift/
    - https://github.com/jonls/redshift
    - sudo apt-get install redshift #geoclue-2.0 redshift-gtk
      - redshift -l lat:long

# KeepassXC (Linux+Mac+Android) https://keepassxc.org/
- https://keepassxc.org/download/#linux
  - https://packages.ubuntu.com/source/cosmic/keepassxc
  - sudo add-apt-repository ppa:phoerious/keepassxc \
    && sudo apt-get update && sudo apt-get -y install keepassxc
- versus:
  - sudo snap install keepassxc
  - AppImage
- https://keepassxc.org/docs/keepassxc-browser-migration/
  - Mozilla, Chromium, and Chrome

# Power
gnome-power-statistics & # Power monitor
Battery Monitor:
- https://www.maketecheasier.com/monitor-laptop-battery-usage-linux/
- https://itsfoss.com/monitor-laptop-battery-linux/
Powertop:
- https://software.intel.com/en-us/articles/powertop-primer-1
- https://www.howtogeek.com/55185/how-to-maximize-the-battery-life-on-your-linux-laptop/

# XPS
Linux on Dell XPS:
- https://www.linuxmint.com/rel_tara_cinnamon.php
  - Release notes talks about trackpads
    - ````apt install xserver-xorg-input-synaptics````
  - https://github.com/bulletmark/libinput-gestures
    - https://wiki.archlinux.org/index.php/Libinput
- https://www.linuxmint.com/rel_tara_cinnamon_whatsnew.php
- https://www.reddit.com/r/dellxps13/comments/5u9elz/the_trackpad/
- https://www.reddit.com/r/Dell/comments/5msolr/ubuntu_on_new_xps_15_9560/
- https://thomashunter.name/blog/installing-linux-mint-on-an-xps13-9350/
- https://www.dell.com/community/Linux-Developer-Systems/Sound-issues-after-resume-from-suspend-hibernate-on-XPS13-9360/td-p/5169011

# Music
- sudo apt-get install --install-suggests ncmpcpp
- No sound from most sources, only desktop switches? or is it too quiet, saw +150% volume 

Dotfiles portability+learning+acceleration:
- https://github.com/webpro/awesome-dotfiles
  - https://github.com/kobus-v-schoor/dotgit
    git clone https://github.com/kobus-v-schoor/dotgit.git ~/Documents/${_##*//}
    dotgit verbose update
  - Considered:
    - https://github.com/noctux/igor
    - https://thelocehiliosan.github.io/yadm/

# VirtualBox
- https://www.virtualbox.org/wiki/Linux_Downloads
  - ````wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add - \
    && echo "deb https://download.virtualbox.org/virtualbox/debian $(grep UBUNTU_CODENAME /etc/os-release | awk -F= '{ print $2 }') contrib" \
    > /etc/apt/sources.list.d/virtualbox.list \
    && sudo apt-get update && sudo apt-get -y install virtualbox-6.0 libsdl-ttf2.0-0 && /sbin/vboxconfig````
    - tried virtualbox-5.2, couldn't install extension pack easily
- https://askubuntu.com/questions/900118/vboxdrv-sh-failed-modprobe-vboxdrv-failed-please-use-dmesg-to-find-out-why
  - Disabled secure boot in BIOS
  - modprobe vboxdrv && sudo /sbin/vboxconfig
- https://www.microsoft.com/software-download/windows10
  - https://www.pcsteps.com/207-windows-virtual-machine-linux-windows/
  - ~10min install, no product key

# Vagrant
- https://www.vagrantup.com/downloads.html
  - Download Debian 64-bit = 2.2.0 x86

# Texlive
  - Texlive-full (via Software Manager) = apt-get remove texlive-full
    - sudo tl-paper set all letter && latex small2e
    - find / -name texlive 2>&1 | grep -v -e denied -e Invalid
    - less /usr/share/texlive/release-texlive.txt
    - firefox file:///usr/share/texlive/readme-html.dir/readme.en.html
    - sudo apt-get install perl-tk # http://tug.org/texlive/distro.html#perltk
    - tlmgr -gui # http://tug.org/texlive/tlmgr.html
  - cd ~/bin/ \
    && wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
    && tar xvf ${_##/} && cd install-tl-*
    - sudo mkdir /usr/local/texlive/2018 && sudo chown -R $(whoami):$(whoami) /usr/local/texlive
    - ./install-tl -gui text
    - ./install-tl -gui wizard

Next for cli/keyboard shortcuts:
  - Toggle radio = Bluetooth+WiFi \(fn-Home = Antenna icon\) versus airplane mode?
  - Toggle portfolio/auto rotate layout
  - Toggle on screen keyboard: quarter, Tablet
  - Long click = right click?
  - Gestures to switch desktops
  - visual disk, power, network, memory, cpu panel applet
  - Suspend OS: not working    
