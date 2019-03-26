# BIOS/OS
- 2019-01-07: Upgraded to 19.1 (Tessa) with Ubuntu Bionic base
  - [Tessa release notes](https://www.linuxmint.com/rel_tessa_cinnamon.php) talk about trackpad, sound, stun/pause video drivers
  - [Ubuntu release notes](https://wiki.ubuntu.com/BionicBeaver/ReleaseNotes)
    - https://netplan.io/
    - https://chrony.tuxfamily.org/comparison.html
    - https://launchpad.net/cloud-init/trunk/18.2
  - See Next/Linux on XPS section
- 2019-01-xx: Disabled BIOS SecureBoot to enable VirtualBox kernel drivers
- 2018-xx: After trying Linux Services for Windows, installed dual-boot Mint
- 2018-xx: Recieved Dell XPS laptop with Win10
# Installed:
- Grub Customizer:
  - https://launchpad.net/~danielrichter2007/+archive/ubuntu/grub-customizer
  - ````sudo add-apt-repository ppa:danielrichter2007/grub-customizer \
    && sudo apt-get update && sudo apt-get install grub-customizer \
    && sudo grub-customizer````
- Software Manager:
  - meld chromium-browser nemo-terminal
  - bluetooth^manager
- Apt:
  - sudo apt-get update && sudo apt-get install git jq tree xdotool ffmpeg
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
    - Toggle on screen keyboard: quarter, Tablet: via Accessibility applet
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
  - http://jonls.dk/redshift/
    - https://github.com/jonls/redshift
    - sudo apt-get install redshift #geoclue-2.0 redshift-gtk
      - redshift -l lat:long
  - https://justgetflux.com/linux.html Attempted & removed

        sudo add-apt-repository ppa:nathan-renniewaldock/flux \
        && sudo apt-get update && sudo apt-get -y install fluxgui
        sudo apt-get remove fluxgui #no xflux!
    - not seeing anything after setting city via fluxgui (appears as applet)
    - https://www.reddit.com/r/linuxmint/comments/68u4g6/flux_on_linux_mint/
  - KeepassXC (Linux+Mac+Android) https://keepassxc.org/
    - https://keepassxc.org/download/#linux
      - https://packages.ubuntu.com/source/cosmic/keepassxc
      - sudo add-apt-repository ppa:phoerious/keepassxc \
        && sudo apt-get update && sudo apt-get -y install keepassxc
    - versus:
      - sudo snap install keepassxc
      - AppImage
    - https://keepassxc.org/docs/keepassxc-browser-migration/
      - Mozilla, Chromium, and Chrome
    - Nice to have it remain minimized/applet/desktop 2?
  - Brave = https://brave-browser.readthedocs.io/en/latest/installing-brave.html#linux

        curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key add -
        UBUNTU_CODENAME=$( (grep DISTRIB_CODENAME /etc/upstream-release/lsb-release || grep DISTRIB_CODENAME /etc/lsb-release) 2>/dev/null | cut -d'=' -f2 )
        echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-$UBUNTU_CODENAME.list
        sudo apt update && sudo apt install brave-browser brave-keyring
  - Docker
    - https://docs.docker.com/install/linux/docker-ce/ubuntu/

          sudo apt-get remove docker docker-engine docker.io containerd runc
          sudo apt-get -y install apt-transport-https \
              ca-certificates curl software-properties-common
          curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
          sudo add-apt-repository \
           "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
           $(cat /etc/upstream-release/lsb-release | grep CODENAME | awk -F= '{print $2}') stable"
          sudo apt-get update && sudo apt-get -y install docker-ce
          sudo docker container run hello-world
    - https://docs.docker.com/install/linux/linux-postinstall/

          sudo groupadd docker && sudo usermod -aG docker mark # NOTE: hardcode!
          sudo systemctl enable docker
          rm -rf ~/.docker/ # && sudo reboot

  - Open Broadcast Studio
    - https://github.com/obsproject/obs-studio/wiki/Install-Instructions#linux
    - sudo add-apt-repository ppa:obsproject/obs-studio
      sudo apt-get update && sudo apt-get install obs-studio
- https://atari800.tistory.com/category/Run%20on%20Ubuntu
  - Toggle on screen keyboard: quarter, Tablet

# VPN
- Palo Alto Global Connect:
  - [Openconnect VPN Client](http://www.infradead.org/openconnect/index.html)
    - sudo apt-get install openconnect network-manager-openconnect-gnome
      - Enables Cisco+Juniper VPN via NW Mgr applet
      - Suggested packages: dnsmasq openssh-server resolvconf
      - Confirmed --script=
      - package is v7.08-3 doesn't have --protocol=gp, v8, released in January 2019!! does.
      - sudo apt-get remove openconnect vpnc-scripts
    - http://www.infradead.org/openconnect/building.html
      - https://github.com/dlenski/openconnect#installation
      - http://lists.infradead.org/pipermail/openconnect-devel/2019-January/005180.html 8.0.1
        - ftp://ftp.infradead.org/pub/openconnect/openconnect-8.01.tar.gz.asc

      tar xvf openconnect*z && cd openconn*/
      sudo apt-get -y install \
        build-essential gettext autoconf automake libproxy-dev \
        libxml2-dev libtool vpnc-scripts pkg-config libgnutls28-dev
      ./configure && make && sudo make install && sudo ldconfig && which openconnect

      - http://www.infradead.org/openconnect/nonroot.html

      sudo ip tuntap add vpn0 mode tun user ${USER}

      openconnect -i vpn0 -s 'sudo -E /usr/share/vpnc-scripts/vpnc-script' \
       --usergroup=portal --protocol=gp --user=mark.lavi gp.nutanix.com

  - [Openconnect VPN Server](http://ocserv.gitlab.io/www/index.html)

# kubeclt+Minikube
- https://github.com/kubernetes/minikube/releases
  - https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-binary-using-native-package-management
  - vs. asdf (learned later)

      sudo apt-get update && sudo apt-get install -y apt-transport-https
      curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
      echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
      sudo apt-get update && sudo apt-get install -y kubectl
 - https://kubernetes.io/docs/tasks/tools/install-kubectl/#configure-kubectl

 - https://kubernetes.io/docs/tasks/tools/install-minikube/#linux
  - via https://github.com/asdf-vm/asdf

      sudo apt-get install automake autoconf libreadline-dev libncurses-dev \
        libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev
      git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.2
      echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
      echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

      asdf plugin-add minikube && asdf list-all minikube
      asdf install minikube 0.32.0 && asdf global minikube 0.32.0
      asdf which minikube

      asdf plugin-add minikube && asdf plugin-update
      asdf current minikube && asdf list-all minikube

- https://github.com/kubernetes/minikube#quickstart
- https://kubernetes.io/docs/setup/minikube/#quickstart

      minikube config set WantReportErrorPrompt false
      minikube start --vm-driver=virtualbox # none is not for developer machines!

# Next
sudo apt-get install parted-doc gparted

- https://gparted.org/livecd.php
- http://www.sysresccd.org

how to grow partition mint
how to change recovery mode/boot/console resolution from grub

# Grub resolution
- c for console; videoinfo
  640x480
  800x600
  *1024x768
  1280x1024
  1600x1200
  was*1920x1080
  native:3480x2160

# Next for cli/keyboard shortcuts:
- Gestures to switch desktops
- Suspend OS: not working
- disk space expansion/management
  - Timeshift GUI: snapshots via rsync
  - sudo du -hs /var/cache/apt/archives && sudo apt-get clean
  - Can Win10 RW ext4?
  - Can Linux RW win partition
- Toggle radio = Bluetooth+WiFi \(fn-Home = Antenna icon\) versus airplane mode?
- Toggle portfolio/auto rotate layout
- Long click = right click?
- Linux on Dell XPS:
    - ````apt install xserver-xorg-input-synaptics````
  - https://github.com/bulletmark/libinput-gestures
    - https://wiki.archlinux.org/index.php/Libinput
  - https://www.reddit.com/r/dellxps13/comments/5u9elz/the_trackpad/
  - https://www.reddit.com/r/Dell/comments/5msolr/ubuntu_on_new_xps_15_9560/
  - https://thomashunter.name/blog/installing-linux-mint-on-an-xps13-9350/
  - https://www.dell.com/community/Linux-Developer-Systems/Sound-issues-after-resume-from-suspend-hibernate-on-XPS13-9360/td-p/5169011

# Dotfiles portability+learning+acceleration:
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
  - ~10+ min install, no product key

# Vagrant
- https://www.vagrantup.com/downloads.html
  - Download Debian 64-bit = 2.2.0 x86

# WebEx
  - https://at.projects.genivi.org/wiki/display/TOOL/WebEx+on+Linux
  - https://gazelle.ihe.net/content/using-webex-under-linux

# Power
  gnome-power-statistics & # Power monitor
  Battery Monitor:
  - https://www.maketecheasier.com/monitor-laptop-battery-usage-linux/
  - https://itsfoss.com/monitor-laptop-battery-linux/
  Powertop:
  - https://software.intel.com/en-us/articles/powertop-primer-1
  - https://www.howtogeek.com/55185/how-to-maximize-the-battery-life-on-your-linux-laptop/

# Music
  - sudo apt-get install --install-suggests ncmpcpp
  - No sound from most sources, only desktop switches? or is it too quiet, saw +150% volume

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
