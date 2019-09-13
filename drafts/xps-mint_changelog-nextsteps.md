<!-- MDTOC maxdepth:6 firsth1:1 numbering:0 flatten:0 bullets:1 updateOnSave:1 -->

- [BIOS and Linux OS](#bios-and-linux-os)   
- [Installed:](#installed)   
- [VPN](#vpn)   
   - [Gaming](#gaming)   
- [kubeclt+Minikube](#kubecltminikube)   
- [Next](#next)   
- [Grub resolution](#grub-resolution)   
- [Next for cli/keyboard shortcuts:](#next-for-clikeyboard-shortcuts)   
- [Dotfiles portability+learning+acceleration:](#dotfiles-portabilitylearningacceleration)   
- [VirtualBox](#virtualbox)   
- [Vagrant](#vagrant)   
- [WebEx](#webex)   
- [Power](#power)   
- [Music](#music)   
- [Kodi+Jellyfish](#kodijellyfish)   
- [Texlive](#texlive)   
- [Windows](#windows)   
- [Mint laptop](#mint-laptop)   
- [Mint desktop](#mint-desktop)   
- [Barrier](#barrier)   
   - [iPod Touch](#ipod-touch)   
   - [Worksession](#worksession)   

<!-- /MDTOC -->
<hr/>
# BIOS and Linux OS
- 2019-01-07: Upgraded to 19.1 (Tessa) with Ubuntu Bionic base
  - [Tessa release notes](https://www.linuxmint.com/rel_tessa_cinnamon.php) talk about trackpad, sound, stun/pause video drivers
  - [Ubuntu release notes](https://wiki.ubuntu.com/BionicBeaver/ReleaseNotes)
    - https://netplan.io/
    - https://chrony.tuxfamily.org/comparison.html
    - https://launchpad.net/cloud-init/trunk/18.2
  - See Next/Linux on XPS section
- 2019-01-xx: Disabled BIOS SecureBoot to enable VirtualBox kernel drivers
- 2018-xx: After trying Linux Services for Windows, installed dual-boot Mint
- 2018-xx: Received Dell XPS laptop with Win10
# Installed:
- Grub Customizer: causes diskfilter boot warning/error
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

        # see directions for updates
        sudo apt update && sudo apt install brave-browser brave-keyring
        #sudo apt-key del "x y z"
  - Docker
    - https://docs.docker.com/install/linux/docker-ce/ubuntu/

          sudo apt-get remove docker docker-engine docker.io containerd runc
          sudo apt-get -y install apt-transport-https \
              ca-certificates curl gnupg-agent software-properties-common
          curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
          sudo add-apt-repository \
           "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
           $(cat /etc/upstream-release/lsb-release | grep CODENAME | awk -F= '{print $2}') stable"
           #versus: $(lsb_release -cs) stable" = Malformed input, repository not added.
          sudo apt-get update && sudo apt-get -y install docker-ce docker-ce-cli containerd.io
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

## Gaming
- https://atari800.tistory.com/category/Run%20on%20Ubuntu
  1. Install [Wine](http://www.wikihow.com/Install-Wine-on-Ubuntu)
  2. Install [Winetricks and MS jet 4.0 engine](http://brianpaul.wordpress.com/2013/09/13/ubuntu-using-microsoft-access-with-wine-msjet40-dll-error-fixed/)
  3. Run 'a8_best_gamepack.exe'
    - NOTE: If the user interface does not work, please disable the skin in the option or set 'gSkin=0' in the 'gamepack\ini\option.ini'.

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

- how to grow partition mint
  - https://askubuntu.com/questions/492054/how-to-extend-my-root-partition
  - https://superuser.com/questions/904611/how-to-extend-a-mint-linux-partition-on-a-dual-boot-config-with-windows-8-1

- how to change recovery mode/boot/console resolution from grub

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

# Windows Resources
- foobar2000.org, Winamp, PuTTY, cygwin + Steam/GoG
- http://winmerge.org/
- https://alliance.seas.upenn.edu/~bcpierce/wiki/index.php?n=Main.UnisonFAQOSSpecific#windows
- https://github.com/Open-Shell/Open-Shell-Menu

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

# Kodi+Jellyfish
- https://kodi.wiki/view/HOW-TO:Install_Kodi_for_Linux

    sudo apt-get install software-properties-common && sudo add-apt-repository ppa:team-xbmc/ppa
    sudo apt-get update && sudo apt-get -y install kodi
- Kodi:
  - Add-ons > Download > Look and Feel > Screensaver > Digital Clock Screensaver
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

# Sync
- mark@Mint laptop:
  - keychain19
  - GnuPG.key:mark@lavi.us
  - ssh.key:mark.lavi.mint.passphrasless.pem
  - /etc/hosts: manual source copy from dotfiles/etc/hosts (for barrier host||alias)
  - See ~/barrier.* autostart?
  - See Unison (destination for mark@Mac laptop)
  - Backup? Unison to desktop?
- mark@Desktop:
  - keychain15
  - GnuPG.key:rfq@atarex.com
  - ssh.key:mark.2017.marimayhem.id_rsa.pem
  - /etc/hosts: manual source copy from dotfiles/etc/hosts (for barrier host||alias)
  - See ~/barrier.* autostart?
  - Gnome Keyring management: p/w lifecycle?
    - https://wiki.gnome.org/Apps/Seahorse
  - See Unison?
  - Backup? mRAID 5TB
- mark@Mac laptop:
  - Pertino-keychain?
  - GnuPG.key:mark.lavi@nutanix.com?
  - ssh.key:mark-macbookair-id_rsa.pem
  - etc/hosts? marimayhem, dellxps13, macbookair-mark (sync for barrier host or alias)
    - dotfiles/etc/hosts, copied2gasmask
  - See ~/barrier.* autostart?
  - See (macbookair-notes.md)
  - unison # will launch QT-UI, select marimayhem profile; see Unison
  - Backup: localTimeMachine-1TB
  - GoG?

# Mint desktop
- docker installed
- sudo apt-get install unison-all-gtk ssh
  - Suggested packages: molly-guard monkeysphere rssh
  - Recommended packages: ncurses-term ssh-import-id
  - Linux brew.sh, vs. Unison dockerfile build or native compile?
- Had to adjust .atom/storage/application.json and ../config.cson for paths
- quot vodet music player installed

# Barrier
- https://github.com/debauchee/barrier/wiki
  - https://members.symless.com/help/s1-troubleshooting/s1-getting-started
  - https://repology.org/project/barrier/packages (deb, etc.)
  - Mac client: https://github.com/debauchee/barrier/blob/master/doc/MacReadme.txt
    - brew cask install barrier
  - Linux server:
    - https://flathub.org/apps/details/com.github.debauchee.barrier
    - flatpak install flathub com.github.debauchee.barrier
    - flatpak run com.github.debauchee.barrier
  - https://members.symless.com/help/s1-troubleshooting/s1-getting-started
    - Server: Configure interactively...
    - Add computer name as shown in logs
    - Reload configuration
    - Barrier > Save Configuration: ~/barrier.conf
    - Qt: Session management error: None of the authentication protocols specified are supported
*** WARNING *** The program 'barrier' called 'DNSServiceRegister()' which is not supported (or only supported partially) in the Apple Bonjour compatibility layer of Avahi.
*** WARNING *** Please fix your application to use the native API of Avahi!
*** WARNING *** For more information see <http://0pointer.de/blog/projects/avahi-compat.html>

  - https://github.com/debauchee/barrier/blob/master/doc/UpdateManpages.txt
- https://alternativeto.net/software/synergy/

# TODO:
- http://roaraudio.keep-cool.org/
- https://ejurgensen.github.io/forked-daapd/
  - Linux/FreeBSD DAAP (iTunes), MPD (Music Player Daemon) and RSP (Roku) media server.
    supports AirPlay devices/speakers, Apple Remote (and compatibles), MPD clients, Chromecast, network streaming, internet radio, Spotify and LastFM
  - https://raspberrypi.stackexchange.com/questions/5508/redirect-audio-to-another-airplay-device
  - http://recycledspace.com/2018/04/my-music-setup-at-home-with-mopidy-forked-daapd-and-shairport-sync.html
  - Vizio TV Airplay (2?)
    - https://support.vizio.com/s/article/AirPlay-HomeKit-Troubleshooting?language=en_US
    - https://support.vizio.com/articles/en_US/EXT_Issues/Apple-AirPlay-2-and-HomeKit-Release-Information?r=2&other.VizioCommunityArticle.getArticles=1&other.VizioCommunityArticle.getArticlesProd=1&other.VizioCommunityArticle.getChatHrs=1&ui-comm-runtime-components-aura-components-siteforce-qb.Quarterback.validateRoute=1&ui-communities-components-aura-components-forceCommunity-seoAssistant.SeoAssistant.getSeoData=1
    - https://support.vizio.com/s/article/Apple-AirPlay-2-and-HomeKit-Release-Information?language=en_US
- https://en.wikipedia.org/wiki/Coherence_(UPNP) PS3 streamer

## Worksession

## iPod Touch
- https://support.apple.com/en-us/HT204217#ipodtouch
  - 5th generation, A1421: May 2013
  - https://support.apple.com/kb/SP675?viewlocale=en_US&locale=en_US
  - Lightning connector
  - S/N: DJ6Q40UGF4JW
  
 molly-guard monkeysphere rssh
Recommended packages:
  ncurses-term ssh-import-id
The following NEW packages will be installed:
  openssh-server openssh-sftp-server

- sudo apt-get install hugo
- brew install openconnect
  - ==> Caveats
==> openssl
A CA file has been bootstrapped using certificates from the SystemRoots
keychain. To add additional certificates (e.g. the certificates added in
the System keychain), place .pem files in
  /home/linuxbrew/.linuxbrew/etc/openssl/certs

and run
  /home/linuxbrew/.linuxbrew/opt/openssl/bin/c_rehash
==> libtool
In order to prevent conflicts with Apple's own libtool we have prepended a "g"
so, you have instead: glibtool and glibtoolize.
==> python
Python has been installed as
  /home/linuxbrew/.linuxbrew/bin/python3

Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
`python3`, `python3-config`, `pip3` etc., respectively, have been installed into
  /home/linuxbrew/.linuxbrew/opt/python/libexec/bin

If you need Homebrew's Python 2.7 run
  brew install python@2

You can install Python packages with
  pip3 install <package>
They will install into the site-package directory
  /home/linuxbrew/.linuxbrew/lib/python3.7/site-packages

See: https://docs.brew.sh/Homebrew-and-Python

- Software sources > Authenticator # https://gitlab.gnome.org/World/Authenticator
  - via flatpack
    - Re-Setup Github
    - Paypal only allows one device; migrated to mobile
- jenkins-x.io
  - https://jenkins-x.io/getting-started/install/
    - curl -L https://github.com/jenkins-x/jx/releases/latest/download/jx-linux-amd64.tar.gz | tar xzv \
    mv jx ~/bin/
  - https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux
    - brew install kubectl
      - ==> kubernetes-cli
      Bash completion has been installed to: /home/linuxbrew/.linuxbrew/etc/bash_completion.d
  - https://jenkins-x.io/getting-started/boot/
    - https://github.com/jenkins-x/cloud-environments
      - https://kubernetes.io/docs/tasks/tools/install-minikube/
        - versus: asdf plugin-list-all | less # brew cask@mac # see asdf
        - https://minikube.sigs.k8s.io/docs/start/
          - KVM or VirtualBox
        - 1.3.1 installed (via package from releases page) and sha256sum checked
        - Installed VirtualBox-6.0, above. New key appended to procedure on page.
        - Installed VirtualBox 6.0.10 Oracle VM VirtualBox Extension Pack
        - minikube config set vm-driver virtualbox
        - minikube dashboard
  - TODO: https://github.com/GoogleCloudPlatform/skaffold (supersedes freshpod)
  - minikube start --cpus 3 --memory 4096
  - https://github.com/helm/helm/blob/master/docs/install.md #2.14.3
    - versus linuxbrew: brew install kubernetes-helm
    - https://helm.sh/docs/using_helm/#quickstart-guide
    - helm init --history-max 200
  - cd ~/Documents/github.com/ && mkdir jenkins-x && cd $_
      - git clone https://github.com/jenkins-x/cloud-environments.git
      - cd cloud-environments/env-minikube/ && make install
    - jx create cluster minikube
    - jx install --provider=minikube --git-username mlavi --git-api-token see secrets.mintdesktop.txt
      - /home/mark/.jx/cloud-environments/env-minikube/myvalues.yaml

      ? Select Jenkins installation type: Serverless Jenkins X Pipelines with Tekton
Context "minikube" modified.
set exposeController Config Domain 192.168.99.101.nip.io
Git configured for user: Mark Lavi and email mlavi@users.noreply.github.com
helm installed and configured
nginx ingress controller already enabled
Set up a Git username and API token to be able to perform CI/CD
? Do you wish to use mlavi as the local Git user for GitHub server: Yes
Select the CI/CD pipelines Git server and user
? Do you wish to use GitHub as the pipelines Git server: Yes
Setting the pipelines Git server https://github.com and user name mlavi.
Cloning the Jenkins X cloud environments repo to /home/mark/.jx/cloud-environments
? A local Jenkins X cloud environments repository already exists, recreating with latest: Yes
Cloning the Jenkins X cloud environments repo to /home/mark/.jx/cloud-environments
Enumerating objects: 1440, done.
Total 1440 (delta 0), reused 0 (delta 0), pack-reused 1440
Updating Secret jx-install-config in namespace jx
Setting up prow config into namespace jx
Installing tekton into namespace jx
WARNING: failed to create system vault in namespace jx due to no "jx-vault-minikube" vault found in namespace "jx"

Installing Prow into namespace jx
with values file /home/mark/.jx/cloud-environments/env-minikube/myvalues.yaml

? Defaulting workload build pack: Kubernetes Workloads: Automated CI+CD with GitOps Promotion
Setting the team build pack to kubernetes-workloads repo: https://github.com/jenkins-x-buildpacks/jenkins-x-kubernetes.git ref: master
Installing jx into namespace jx
Installing jenkins-x-platform version: 2.0.951


WARNING: waiting for install to be ready, if this is the first time then it will take a while to download images
Jenkins X deployments ready in namespace jx
Configuring the TeamSettings for ImportMode YAML
Creating default staging and production environments
? Select the organization where you want to create the environment repository: mlavi-workshops
Using Git provider GitHub at https://github.com
? Using Git user name: mlavi
? Using organisation: mlavi-workshops
Creating repository mlavi-workshops/environment-snarlnimble-staging
Creating Git repository mlavi-workshops/environment-snarlnimble-staging
Pushed Git repository to https://github.com/mlavi-workshops/environment-snarlnimble-staging

Creating staging Environment in namespace jx
Created environment staging
Namespace jx-staging created
Creating GitHub webhook for mlavi-workshops/environment-snarlnimble-staging for url http://hook.jx.192.168.99.101.nip.io/hook
Using Git provider GitHub at https://github.com
? Using Git user name: mlavi
? Using organisation: mlavi-workshops
Creating repository mlavi-workshops/environment-snarlnimble-production
Creating Git repository mlavi-workshops/environment-snarlnimble-production
Pushed Git repository to https://github.com/mlavi-workshops/environment-snarlnimble-production

Creating production Environment in namespace jx
Created environment production
Namespace jx-production created
Creating GitHub webhook for mlavi-workshops/environment-snarlnimble-production for url http://hook.jx.192.168.99.101.nip.io/hook

Jenkins X installation completed successfully


	********************************************************

	     NOTE: Your admin password is: see secrets.mintdesktop.txt

	********************************************************


Your Kubernetes context is now set to the namespace: jx
To switch back to your original namespace use: jx namespace jx
Or to use this context/namespace in just one terminal use: jx shell
For help on switching contexts see: https://jenkins-x.io/developing/kube-context/
To import existing projects into Jenkins:       jx import
To create a new Spring Boot microservice:       jx create spring -d web -d actuator
To create a new microservice from a quickstart: jx create quickstart

versus
  - https://github.com/kubernetes/kops
    - https://github.com/kubernetes/kops/blob/master/docs/addons.md
-
