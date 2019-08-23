# Laptop setup:  

* WiFi, Yosemite OS updates, Settings > Trackpad > Tap to click
* ```` cd ~; for i in Pictures Music; do sudo mv $i Documents/; ln -s
    Documents/$i/ $i; done ````  
* Download via Safari:  
  * iterm2 vs. `brew cask install iterm2`
  * Flowdock vs. `brew cask install flowdock`
  * Chrome, FireFox
  * VirtualBox + ext.pack
  * Vagrant/Consul/Packer/Terraform
  * Kitematic/Docker?
  * Tor browser: torproject.org? vs&nbsp; `brew cask install torbrowser`
  * videolan.org
* Install Brew and Cask (implies XCode CLI and git-apple)  
  1. ruby -e "$(curl -fsSL
    https://raw.githubusercontent.com/Homebrew/install/master/install)"
  2. sudo chown -R mark:admin /usr/local/etc
  4. brew install caskroom/cask/brew-cask
    1. http://caskroom.io/search
  4. # p7 e filespec
  8. brew install makedepend ; brew install tmux
      1. brew cask install cdock
    * ssh-keygen -b 4096 -C "mark@ideadevice.com mbair 20150506"
        1. Add to lavi.us, Github, Gitlab

# Python: see [brew.sh](./brew.sh) page

# Vagrant: see [./vagrant.md](Vagrant).md page.

# Docker/Kitematic:
* nsenter
* ipa-server
* `brew cask install boot2docker-status`

# Chef
  1. Install
    [https://downloads.chef.io/chef-dk/](https://downloads.chef.io/chef-dk/)
    2. [https://docs.chef.io/install_dk.html](https://docs.chef.io/install_dk.html)
    3. [https://docs.chef.io/#chef-dk-title](https://docs.chef.io/#chef-dk-title)
    4. vagrant plugin install vagrant-berkshelf  
* HomeOffice: Printer and Scanner  
  1. [http://www.brother-usa.com/support/ModelInfo.aspx?R3ModelID=HL3170CDW](Brother HL-3170CDW): install CUPS driver for printing
    2. [http://support.brother.com/g/b/colist.aspx?c=us&amp;lang=en&amp;prod=hl3170cdw_all&amp;cao=tn](Consumables & Accessories | HL-3170CDW | United States | Brother)
    3. TN-221BK, TN-225(C||M||Y)
      4. NewEgg: BK=84.99/80.72sub, Color=73.99/70.29sub w/ 10% off
      5. Amazon: $67.03, $30 knockoff  
    1. [http://www.brother-usa.com/wheretobuy/default.aspx?PG=1#.VWyhwBLZEg1](Brother International - Where to Buy Brother Products)
  1. <a
href="http://www.usa.canon.com/cusa/support/consumer/printers_multifunction/pixma_mx_series/pixma_mx410?selectedName=DriversAndSoftware">Canon
      Pixma MX410</a>: install MP Navigator EX and TWAIN scanner driver  

# Todo:
* Eclipse + LDAP + PlantUML via Brew Cask?
  * `brew cask install apache-directory-studio`
  * `vs. eclipse-ide, -modeling, -php, -ptp`
* CD system via containers:
  1. http://en.wikipedia.org/wiki/List_of_LDAP_software#Linux.2FUNIX = LDAP
    2. [FreeIPA](http://www.freeipa.org/page/Downloads)
      (with Fedora DS + Dogpile)
      3. https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Linux_Domain_Identity_Authentication_and_Policy_Guide/using-the-ui.html
      4. http://www.freeipa.org/page/Quick_Start_Guide
      5. http://www.freeipa.org/page/Docker
        = https://registry.hub.docker.com/u/adelton/freeipa-server/
    1. Apache DS
    2. OpenLDAP
    3. vs http://en.wikipedia.org/wiki/SAML-based_products_and_services = SAML
      which could depend on LDAP and provide OAuth2.
      4. https://forgerock.org/openam/#openam-feature-overview
      5. http://wso2.com/products/identity-server/  
      6. http://www.adas-sso.com/en/sso/sso.php
      7. http://www.gluu.org
      8. http://www.josso.org/confluence/display/JOSSO1/JOSSO+-+Java+Open+Single+Sign-On+Project+Home

  1. RCS:  
    2. [gitlab](http://doc.gitlab.com/ee/integration/ldap.html)+gitlab-ci
      (<a
        href="https://registry.hub.docker.com/u/anapsix/gitlab-ci/">container.v1</a>
      <a
        href="https://registry.hub.docker.com/u/brightcommerce/gitlab/">container.v2</a>)
      vs. <a
href="https://github.com/takezoe/gitbucket/wiki/LDAP-Authentication-Settings">gitbucket</a>
    3. vs. Jenkins (<a
        href="https://registry.hub.docker.com/u/aespinosa/jenkins/">container</a>
      or <a
href="https://registry.hub.docker.com/u/stephenreed/jenkins-java8-maven-git/">container</a>
      w/ persistent store)
* [http://www.freesmug.org/start](http://www.freesmug.org/start)
* Markdown examples  

# SSD Upgrade

- https://www.upgradeable.com.au/pages/macbook-air-ssd-upgrade-guide
- https://www.owcdigital.com/products/aura-pro-x#overview
  - https://eshop.macsales.com/item/OWC/S3DAPB4MB10D/
  - https://www.owcdigital.com/assets/dealer/slicks/Product_Spec_Sheets/owc-aura-pro-x.pdf
  - https://www.owcdigital.com/assets/products/aura-ssd/Aura-SSD-Mid-2013-Later-MacBook-Air-Pro-Retina.pdf
  - Procedure
     - https://www.owcdigital.com/support/formatting
     - https://www.owcdigital.com/migrating-your-mac-os-x-installation-to-a-new-drive
     - https://eshop.macsales.com/installvideos/macbook_air_2013_2014/
     - [How to reinstall macOS from macOS Recovery
](https://support.apple.com/en-us/HT204904)
     - [Restore your Mac from a backup](https://support.apple.com/en-us/HT203981#macos)
     - [About macOS Recovery
](https://support.apple.com/en-us/HT201314)
