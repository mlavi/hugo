for i in box plugin; do echo __ ${i} __ ; vagrant ${i} list; done
$ cd /Users/mark/Documents/github.com/ideadevice/infra/poc/ubuntu \
  && vagrant box update && vagrant plugin update

brew cask install vagrant
# reworked casks, see ./brew.sh

vagrant plugin install vagrant-auto_network
vagrant plugin install vagrant-cachier
vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-vbguest

# no go:
vagrant plugin install vagrant-box-version

# not tried or obselete need?
vagrant-berkshelf
vagrant-multiprovider-snap
vagrant-nixos-plugin
vagrant-share

# vagrant global-status --prune

#_____

* https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Plugins  
  * vagrant plugin install vagrant-box-updater
  *  `vagrant plugin install vagrant_box_version`
  * https://github.com/phusion/open-vagrant-boxes
    1. vagrant init phusion/ubuntu-14.04-amd64
    2. brew install p7zip
  * https://github.com/scalefactory/vagrant-multiprovider-snap
      `vagrant plugin install vagrant-multiprovider-snap`
* LinuxMint Box experiment:  
  1. vagrant package --base LinuxMint-17.1  
  2. vagrant box add package.box --name linuxmint-17.1  
  3. vagrant init linuxmint-17.1
*  --provider vmware_fusion
  1. vagrant plugin install vagrant-vmware-fusion  
    Installed the plugin 'vagrant-vmware-fusion (3.2.6)'!
  2. vagrant plugin license vagrant-vmware-fusion license.lic
