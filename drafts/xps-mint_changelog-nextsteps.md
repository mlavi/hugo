Installed:
- Grub Customizer:
  - https://launchpad.net/~danielrichter2007/+archive/ubuntu/grub-customizer
  - ````sudo add-apt-repository ppa:danielrichter2007/grub-customizer \
    && sudo apt-get update && sudo apt-get install grub-customizer \
    && sudo grub-customizer````
- Software Manager:
  - meld chromium-browser nemo-terminal
  - bluetooth^manager
  - Texlive-full
    - sudo tl-paper set all letter && latex small2e
    - find / -name texlive 2>&1 | grep -v -e denied -e Invalid
    - less /usr/share/texlive/release-texlive.txt
    - firefox file:///usr/share/texlive/readme-html.dir/readme.en.html
    - sudo apt-get install perl-tk # http://tug.org/texlive/distro.html#perltk
    - tlmgr -gui # http://tug.org/texlive/tlmgr.html
- sudo apt-get update && sudo apt-get install git tree
- sudo apt install snapd && sudo snap install slack --classic
- sudo apt-get install --install-suggests ncmpcpp
- See: Atom with Dotfiles+Shell+CLI acceleration/research=blog/atom.md
- Desktop launcher for: Atom, Slack, Meld
- Add to Firefox:
  - Theme
  - Add-on

gnome-power-statistics & # Power monitor
Battery Monitor:
- https://www.maketecheasier.com/monitor-laptop-battery-usage-linux/
- https://itsfoss.com/monitor-laptop-battery-linux/
Powertop:
- https://software.intel.com/en-us/articles/powertop-primer-1
- https://www.howtogeek.com/55185/how-to-maximize-the-battery-life-on-your-linux-laptop/
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

Dotfiles portability+learning+acceleration:
- https://github.com/webpro/awesome-dotfiles
  - https://github.com/kobus-v-schoor/dotgit
    git clone https://github.com/kobus-v-schoor/dotgit.git ~/Documents/${_##*//}
    dotgit verbose update
  - Considered:
    - https://github.com/noctux/igor
    - https://thelocehiliosan.github.io/yadm/

VirtualBox+Vagrant
- https://www.virtualbox.org/wiki/Linux_Downloads
  - ````wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add - \
    && echo "deb https://download.virtualbox.org/virtualbox/debian $(grep UBUNTU_CODENAME /etc/os-release | awk -F= '{ print $2 }') contrib" \
    > /etc/apt/sources.list.d/virtualbox.list \
    && sudo apt-get update && sudo apt-get -y install virtualbox-5.2 && /sbin/vboxconfig````

- https://www.vagrantup.com/downloads.html
  - Download Debian 64-bit = 2.2.0 x86

Next for cli/keyboard shortcuts:
  - Toggle radio = Bluetooth+WiFi \(fn-Home = Antenna icon\) versus airplane mode?
  - Toggle portfolio/auto rotate layout
  - Toggle on screen keyboard: quarter, Tablet
  - Long click = right click?
  - Gestures to switch desktops
  - Blue light filter: https://alternativeto.net/software/blue-light-filter-for-eye-care/?platform=linux
    - https://justgetflux.com/linux.html
    - ````sudo add-apt-repository ppa:nathan-renniewaldock/flux \
      && sudo apt-get update && sudo apt-get -y install fluxgui````
  - visual disk, power, network, memory, cpu panel applet
  - Suspend OS: not working
