---
tags: ['linux', 'alpine', 'ansible', 'packer', 'artifact', 'infrastructure-as-code', 'developer', 'operating-system', 'pets', 'configuration-management', 'cloud-init', 'bootstrap']
date: "2021-01-26T09:37:33-06:00"
title: "Learning AlpineLinux.org, Ansible.com, and Packer.io"
---
For my 2020-1 holiday break, I decided my next personal project would be to rebuild my home infrastructure on containers. I'd been inspired by a recent discovery of [LinuxServer.io](https://linuxserver.io), where open source projects are built and run as containers. While I have a burning desire to better my Kubernetes practice, not enough of the world delivers software as a Helm chart, so merely running everything as containers would be a good intermediate step. Let me share my first six steps with examples...<!--more-->

# A Pre-destined Journey

My previous three employers had provided an Apple laptop and most recently I requested to a Dell XPS laptop with Windows, which I made dual-boot Linux (because I knew that line supported Linux via Sputnik project). I refined my practices over the years to make my work mostly OS independent and portable, adapting everything I could towards open source applications, version controlled work, and containers when possible. The tactical choices I made along the way to support these strategic goals were exemplified by adopting [git, dotfiles, KeePassXC](./git-for-operators/#2020-04-19-securing-pets-in-git), and Unison. The goal was to "containerize" as many applications and services as possible and manage them with Kubernetes, but take smaller, logical steps to arrive there.

# Hardware

When COVID-19 and shut-down travel, my 10 year old Linux desktop became my primary workstation. Fortunately, I'd  upgraded my monitor earlier that year, so I was set. With a lot of polishing, I migrated all of my day to day work to Linux from Mac. Today, the primary reason I use my Mac is for being on the road, videoconferencing, and Powerpoint.

I had personally invested into buying double the memory for a work supplied Intel Skull Canyon i5 NUC, but it always struggled to run [Nutanix Community Edition](https://www.nutanix.com/products/community-edition) with AOS, Prism Central, and Calm plus some workload VMs and furthermore, community support would challenge my productivity. So it was idle, smaller, faster, and quieter than my desktop, and ideal to host this holiday project as a headless server.

# Operating System

I considered loading my [Linux desktop OS](https://linuxmint.com/) onto the Skull Canyon for familiarity, OS parity, and ease of maintenance (even caching OS updates across them). But my strategic goal was to boot and run containers, that meant the OS should be focused on  "boot to Docker" and eventually "boot to Kubernetes" which meant that it should be a minimal Linux OS, not a general purpose desktop focus.

I investigated the current minimal Ubuntu or Debian server variant distributions to remain in the .deb package format Linux family branch. But for years, the majority of the Docker community has settled on using [AlpineLinux.org](https://AlpineLinux.org) as a base OS image for containers because it is small and secure. The AlpineLinux team's pragmatic and relentless focus means that the OS minimizes (memory and disk) resource use, performs well, and updates regularly, so I pursued it.

After importing the AlpineLinux.org GPG key, [downloading](https://alpinelinux.org/downloads/), checking,

```shell
URL=https://dl-cdn.alpinelinux.org/alpine/v3.12/releases/x86_64/alpine-extended-3.12.3-x86_64.iso

for FILE in '' .asc .sha256; do
  wget --continue ${URL}${FILE}
done

IFS='/' read -ra FILESPEC <<< "${URL}"
gpg --verify ${FILESPEC[-1]}.asc \
  && sha256sum --check ${FILESPEC[-1]}.sha256 \
  && echo -e "\n__VERIFIED: ${FILESPEC[-1]}" \
  && rm -i ${FILESPEC[-1]}.*
```

...and writing the AlpineLinux Extended 3.12.3 x86-64 ISO (525 MB) to a USB thumb drive, I booted it up on the Skull Canyon. This was important to see how much of the hardware was supported by Alpine and worked "out of the box." Although the ethernet NIC wasn't recognized, WiFi did work.  So I perused [wiki.AlpineLinux.org](https://wiki.alpinelinux.org/) guides, logged in as root, and began a CLI journey to learning Alpine!

# Reproducible Pets

I knew that everything I did by hand was bespoke, so like any good scientist, I kept notes on goals, facilities (research and references), and procedures (mostly shell commands). My blog journey had already ingrained the habits of using Markdown with my choice of [IDE](https://Atom.io) with Markdown Preview, but a recent discovery of [Typora](https://typora.io/) as a great hybrid Markdown WYSIWYG editor had spoiled me. Now I had a nice visual notebook to log my work, reminiscent of my past work with [Project Jyupiter](https://jupyter.org/) and Mathematica!

Documenting PetOps (manual operations made by hand) was not enough, the goal was to automate my work.

`setup-alpine` accepts environment variables and command line arguments or an answer file for automation, so I set about to learn just enough of the initial configuration, service (NTP, SSH), network, and disk choices to install the OS to the disk. I created a stub answer file, adapted it with what I knew (hard-coded every value), and worked to repeat the OS install with the answer file. This small loop guided my research, documentation, and answer file development! (*Red-green-refactor!*)

The generic answer file `setup-alpine -c` generates is a configuration file with key="value" and # comment format, compatible with Java.properties or TOML. My editor can lint TOML, so I decided to organize answer files in a directory: alpine/answerfile/${HOSTNAME}.toml.

I SCP'd the answer file and any other supporting notes, scripts, or configuration off the Skull Canyon and kept the results along with my alpine/README.md documentation in Git. All of this work was done on the Skull Canyon while hooked up to a keyboard and monitor. I remember the days of VMK (Video, Mouse, Keyboard) switches and cables to each physical server in the data center, but I was eager to get the Skull Canyon off my desk and work on it remotely.

Here's my development VM answer file = **alpine/answerfile/skull-vm-packer-dev.toml**:

```toml
# Answer file for setup-alpine script; tested on: cat /etc/alpine-release
# 3.12.3, 3.13.0
#---
KEYMAPOPTS="us us"
HOSTNAMEOPTS="-n skull-vm-packer-dev"

# Search domain, public nameserver
DNSOPTS="-d example.com 9.9.9.9"
TIMEZONEOPTS="-z UTC"

# Contents of /etc/network/interfaces
INTERFACESOPTS="auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
    hostname skull-vm-packer-dev
"

# If you don't want to use a certain option, then comment it out
PROXYOPTS="none"
# -r: Add a random mirror, -f = detect fastest
APKREPOSOPTS="-1"

SSHDOPTS="-c openssh"
NTPOPTS="-c chrony"

DISKOPTS="-m sys -v /dev/vda"
APKCACHEOPTS="/media/sda1/cache"

```

The next goal was to setup a regular account with `sudo` access to perform post-OS install work, which became a second script. Now I could remotely work on the Skull Canyon! Having achieved a beach head with remote access to my pet Skull Canyon "production" server, it was time to make a virtual pet server and experiment with it safely while also speeding up development.

I used VirtualBox's GUI to create a VM from the same Alpine ISO and figured out the basic VM resource configuration for this development instance (memory, storage, bridge network, etc.). Then I learned how to script changing the VM disk using VirtualBox's CLI `VBoxManage`, rather than create a new VM from scratch each time in the GUI, to simulate a new OS install and improve development cycle time. I minimized the VM disk size to further speed each cycle.

I tried three experiments to further improve Alpine VM development:

1. An [Alpine Vagrant box](https://app.vagrantup.com/roboxes/boxes/alpine312) is convenient, but it substituted my source ISO with [a less vetted source](https://roboxes.org/) and required re-learning additional Vagrant configuration to manipulate VirtualBox.
2. Adding [VirtualBox Guest Additions](https://wiki.alpinelinux.org/wiki/VirtualBox_guest_additions) to Alpine is a work in progress that seems to require an entire desktop installation, which is unnecessary for a headless server. I missed being able to cut and paste between guest VM and my host Desktop, but this helped keep me honest for state transfer of reproducible scripts and files for my work on the VM guest, not hand-maintained PetOps.
3. [Cloud-init](https://git.alpinelinux.org/aports/tree/community/cloud-init/README.Alpine) is in the (rolling OS) edge repository, but I wanted to remain on a more fixed, stable OS release.

I was spoiled by the small customizations and optimizations I could make with `VBoxManage`, which had quickened my development cycle time into a `vm-init.sh` launch script which handled:

1. Rip down a running VM
2. Create a new VM disk
3. Start a Python HTTP web server (to supply the answer file and bootstrapping scripts)
4. Start the VM with specific resource configurations and media as needed

I worked to refactor many of the hard-coded values out of `vm-init.sh` and move them to a [DirEnv](https://direnv.net/) .env file, which automatically populate my shell's environment variables when I change into an enabled directory. I configured `.gitignore` to omit any .env file, so I will not accidentally commit any sensitive information, such as a password. By moving the hard-coded values to environment values, my code is much more *portable and stable* because it supports different scenarios without change. The environment variables can be further leveraged for Docker, Ansible, and Packer. Finally, I can think about how to organize the environment variables for better re-use and consistency across tools and environments.

Let me share my current DirEnv's `.envrc` and `.env` configuration files, then my `vm-init.sh` guest maintenance script. You can see I override VM_NAME and MEDIUM_ISO rather than comment them out in the `.env` file. I've also expanded the maintenance script for more use cases and you will see some cloud-init experimental work.

```shell
$ cat .envrc
# https://direnv.net/man/direnv-stdlib.1.html
# EDITOR=vi direnv edit . && direnv allow # enable delta
dotenv

if on_git_branch; then
  echo && git status --short --branch &&
    echo && git fetch --verbose
fi

$ cat .env
PUID=1000
PGID=1000
#
BOOT_CD=
CREATEMEDIUM_FORMAT=vdi
CREATEMEDIUM_SIZE=6144
# megabytes = 6GB*1024MB/GB (was 4GB)
# sda3 4.3G
# df -hs | grep -e Size -e sda
CREATEMEDIUM_VARIANT=Fixed
# CREATEMEDIUM_VARIANT=Variable didn't work with Alpine: too primitive || need VMBox.ext?
MEDIUM_ISO=/usr/share/virtualbox/VBoxGuestAdditions.iso
OSTYPE=Linux_64
PORT=7979
POWER=poweroff
SLEEP=5
SUFFIX=sys
STORAGEATTACH_STORAGECTL=SATA
STORAGEATTACH_PORT=1
VM_DIR=VirtualBox VMs
#
VM_NAME=Alpine-3.12.3
MEDIUM_ISO=vm-iso/alpine-extended-3.12.3-x86_64.iso
#
VM_NAME=Alpine-3.13.0
MEDIUM_ISO=vm-iso/alpine-virt-3.13.0-x86_64.iso

$ cat vm-init.sh
#!/usr/bin/env bash

# vboxmanage controlvm "${VM_NAME}" reset #poweroff
#__ static and defaults moved to .env
# https://www.virtualbox.org/manual/UserManual.html

function vm_create() {
  # TODO: create new VM props, we are recreating Vagrant :(
  local _image_mount
  local _image_raw
  local _image_vmdk

  echo "|CREATE|"

  VBoxManage unregistervm "${VM_NAME}" --delete || true
  VBoxManage createvm --name "${VM_NAME}" --ostype "${OSTYPE}" --register
  # VBoxManage createhd --filename /VirtualBox/${VM_NAME}/$VM.vdi --size 32768
  VBoxManage storagectl "${VM_NAME}" --name 'IDE' --add ide
  # VBoxManage storageattach "${VM_NAME}" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium /u01/Software/OL/OracleLinux-R7-U6-Server-x86_64-dvd.iso
  VBoxManage storagectl "${VM_NAME}" --name 'SATA' --add sata --controller IntelAHCI
  #VBoxManage storageattach "${VM_NAME}" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium /VirtualBox/$VM/$VM.vdi

  VBoxManage modifyvm "${VM_NAME}" --ioapic on \
    --boot1 disk --boot2 dvd --boot3 none --boot4 none \
    --memory 1024 --vram 33 \
    --bioslogodisplaytime 20 \
    --nic1 bridged --bridgeadapter1 enp5s0 \
    --mouse ps2 --clipboard bidirectional \
    --audio oss --audioout on

  echo -e '\n|CLOUD-INIT|development...'
  _image_mount="/mnt/cloud-init/${VM_NAME}"
  _image_raw="cloud-init/${VM_NAME}.img"
  _image_vmdk="cloud-init/${VM_NAME}_cloud-init.vmdk"

  sudo umount "${_image_mount}" || true
  rm -f "${_image_raw}" "${_image_vmdk}" || true

  dd if=/dev/zero of="${_image_raw}" \
    bs=1 count=0 seek=2M 2> /dev/null \
    && mkfs.vfat -n CIDATA "${_image_raw}" \
    && (sudo mkdir --parents "${_image_mount}" 2> /dev/null || true) \
    && sudo mount "${_image_raw}" "${_image_mount}" \
    && mount -l | grep "${_image_mount}" \
    && echo \
    && sudo cp cloud-init/meta-data "${_image_mount}/" \
    && echo 'instance-id: skull-vm-1' \
    | sudo tee "${_image_mount}/user-data" \
    && ls -l "${_image_mount}"/*-data \
    && sudo umount "${_image_mount}" \
    && echo -e '\n\thttps://stackoverflow.com/questions/454899/how-to-convert-flat-raw-disk-image-to-vmdk-for-virtualbox-or-vmplayer' \
    && VBoxManage convertfromraw "${_image_raw}" "${_image_vmdk}" --format VMDK \
    && vboxmanage storageattach "${VM_NAME}" --type hdd \
      --medium "${_image_vmdk}" \
      --storagectl "${STORAGEATTACH_STORAGECTL}" \
      --port $((STORAGEATTACH_PORT + 1)) \
    && echo "|ADD|${_image_vmdk}"
}

if (($(vboxmanage list runningvms | grep --count "${VM_NAME}") > 0)); then
  echo "|POWER|${VM_NAME} ${POWER} ..."
  vboxmanage controlvm "${VM_NAME}" "${POWER}" \
    && sleep 2
fi

if [[ -z ${1} ]]; then
  INDEX=1

  if vboxmanage showvminfo "${VM_NAME}" > /dev/null; then
    INDEX=$(vboxmanage showvminfo "${VM_NAME}" \
      | grep "${STORAGEATTACH_STORAGECTL}" \
      | grep "(${STORAGEATTACH_PORT}," \
      | awk -F".${CREATEMEDIUM_FORMAT} " '{print $1}' \
      | awk -F"${SUFFIX}" '{print $NF}')
  else
    vm_create
  fi

  if (($((INDEX)) >= 1)); then
    echo "|INDEX|Guess: ${INDEX}"
  else
    echo "|DEBUG|INDEX=${INDEX}|"
    ERROR=10
    echo "|ERROR|${ERROR}|REQUIRED: the numeric index of the current mounted VM Disk for: ${VM_NAME}"
    exit ${ERROR}
  fi
else
  INDEX=$((${1}))

  if ((INDEX == 0)); then
    vm_create
  else
    echo "|USAGE|${0} [Integer: new disk index] [VM_NAME]"
  fi
fi

if [[ -z ${2} ]]; then
  echo "|WARNING|Using: ${VM_NAME}"
else
  VM_NAME="${2}"
fi

#__ derived:
# echo "|DEBUG|INDEX=${INDEX}|"
DISK_PATH="${HOME}/${VM_DIR}/${VM_NAME}/${VM_NAME}-${SUFFIX}"
NEW_PATH="${DISK_PATH}$((INDEX + 1)).${CREATEMEDIUM_FORMAT}"
OLD_PATH="${DISK_PATH}${INDEX}.${CREATEMEDIUM_FORMAT}"

if [[ ! -e ${NEW_PATH} ]]; then
  vboxmanage createmedium disk --format "${CREATEMEDIUM_FORMAT}" \
    --filename "${NEW_PATH}" --variant "${CREATEMEDIUM_VARIANT}" \
    --size "${CREATEMEDIUM_SIZE}"
else
  echo "|EXISTS|${NEW_PATH}"
fi

vboxmanage storageattach "${VM_NAME}" --type hdd --medium "${NEW_PATH}" \
  --storagectl "${STORAGEATTACH_STORAGECTL}" \
  --port "${STORAGEATTACH_PORT}" \
  && echo "|ADD|${NEW_PATH} ..." \
  && if [[ -e ${OLD_PATH} ]]; then
    vboxmanage closemedium --delete disk "${OLD_PATH}" \
      && echo "|DELETE|${OLD_PATH}"
  else
    echo "|GONE|${OLD_PATH}"
  fi

# TODO: change boot order?
vboxmanage storageattach "${VM_NAME}" \
  --storagectl IDE --port 1 --device 0 --type dvddrive \
  --medium "${MEDIUM_ISO}" \
  && echo -e "|ADD|CD-ROM@IDE, port 1, slot 0|boot media: ${MEDIUM_ISO}"

# echo -e "|START|${VM_NAME}.\n|SLEEP|${SLEEP}|to allow ^Cancel..."
# sleep "${SLEEP}"

echo && sleep 4 && echo '|START|...' \
  && vboxmanage startvm "${VM_NAME}" --type gui & # headless || gui

vboxmanage showvminfo "${VM_NAME}" --machinereadable \
  > "${VM_NAME}".machinereadable.toml

# sudo systemctl disable apache2
pkill --full "python -m SimpleHTTPServer ${PORT}" \
  && echo -e '\n|TERMINATE|python.http server...'
(
  python -m SimpleHTTPServer "${PORT}" \
    || python -m http.server "${PORT}"
) \
  && echo -e '\n|START|python.http server...' &

ssh-keygen -f "${HOME}/.ssh/known_hosts" \
  -R 'skull-vm' -R 'skull-vm-dev' || true

if (($(pgrep VBoxXPCOMIPCD) > 0)); then
  echo 'TODO: start GUI via: virtualbox &'
fi

echo "\
 lost: mount setlogo=0 and controlvm run \
 vboxmanage controlvm ${VM_NAME} reset #poweroff \

" && head -n7 init.sh

```

From the script above, I wanted to call attention to this command:

    `vboxmanage showvminfo "${VM_NAME}" --machinereadable "${VM_NAME}".machinereadable.toml`

which allows me to easily find the textual difference between any two VM setups, *e.g:* `diff alpine/*.machinereadable.toml`, to understand what I needed to synthesize the same results by building an infrastructure VM. This is a critical differentiation for *infrastructure as code* versus the standard operator facilities of snapshot and clone in order to reproduce VM results. Furthermore, this leads to the path of building infrastructure VM artifacts in a later section. When we act more like a scientist than a craftsman, we can amplify that knowledge gain across any organization. Of course, I aspire to be a craftsman scientist: the hybrid is more interesting and relatable. The journey to improve one's skills and while pursuing or improving the state of the art will never end!

I continued development of my bootstrap procedure and scripts by creating an initialization script (`init.sh`), which would SCP the answer file and a post-OS install script (`post.sh`) from my desktop, then use them.

Alpine's default shell is `busybox`, a reduced form of `ash`. Fortunately, [shellcheck](https://www.shellcheck.net/) is a nice addition to my IDE and it kept me in good form and syntax as I developed these scripts. I didn't have to install and test `busybox` directly on my Desktop OS or install `bash` on Alpine, which would have required further bootstrapping during the initialization stage.

I re-factored `init.sh` from using `scp` to use `git` and then to use http for file transfer with `wget`, removing the need to install any packages. You can see in my examples that I have a habit of keeping copious notes in my code. Notes can consist of goals, pseudo code, lots of URLs, #TODOs, and #TOFIX notes. All of the time, I would improve capabilities while moving procedures and references out of my code and into documentation when I found a better method, an alternate facility, or a dead-end. I also moved work between `init.sh` and `post.sh` where appropriate to minimize setup before the first reboot to boot the OS from storage.

I arrived at a point where I needed to type three commands to bootstrap the development VM with a fully automated OS install and reboot, leaving one post OS configuration script that would survive the reboot. You will see this pattern repeated and most of the scripts reused in the the VM Artifact section!

```bash
KEYMAPOPTS='us us' setup-alpine -q # keep commands in this order!
hostname skull-vm
wget http://desktop:port/init.sh -O - | sh
```

I learned about the [OpenRC init system on Alpine](https://wiki.alpinelinux.org/wiki/Alpine_Linux_Init_System), but did not automate the invocation of post OS configuration on first boot because I was eager to start on the next step: where fully remote automation work would take over.

Let me share my current `init.sh` and `post.sh`, these have been re-factored to accommodate `bootstrap.sh` for Packer in the "VM Artifacts" section.

```shell
$ cat init.sh
#!/usr/bin/env sh
# tested on: 3.12.3, 3.13.0 # cat /etc/alpine-release
#---
# packer example from wiki.alpinelinux.org: "ifconfig eth0 up && udhcpc -i eth0<enter><wait5>",
#--- Diagnostics:
# cat /etc/network/interfaces; echo; cat /etc/apk/repositories
# ip link && echo && ip route list && echo && ip addr show
# mount | grep md

_artifact_host='desktop'
_artifact_ip='192.168.168.168'
_artifact_port=7979
_artifact_url="http://${_artifact_host}:${_artifact_port}/"

# shellcheck disable=SC2039
echo -e "${_artifact_ip}\t${_artifact_host}" >> /etc/hosts \
  && wget "${_artifact_url}post.sh" -O /etc/post.sh \
  && echo "sh /etc/post.sh" >> /etc/motd \
  && wget "${_artifact_url}id_rsa.pub" -O /etc/id_rsa.pub \
  && wget "${_artifact_url}answerfile/$(hostname).toml" \
  && wget "${_artifact_url}bootstrap.sh" -O - | sh

$ cat post.sh
#!/usr/bin/env sh

_remote_group='ansible'
_remote_group_id=1000
_remote_user='ansible' # defined in ansible/.env, still some hardcodes
_remote_user_id=1000

apk_repo_add() {
  _repos='community' # community testing'
  _repositories='/etc/apk/repositories'

  # shellcheck disable=SC2015
  for _repo in ${_repos}; do

    if [ ! -e ${_repositories}.original ]; then
      cp ${_repositories} ${_repositories}.original
    fi

    grep '#' ${_repositories}.original \
      | grep ${_repo} \
      | head -n 1 \
      | tr -d '#' >> ${_repositories} \
      && echo "${_repositories}: enabled ${_repo}" >> /etc/motd
  done
}

remote_user_group_add() {
  addgroup -g ${_remote_group_id} ${_remote_group} || true
  # apk update &&
  # apk add bash direnv libuser &&
  #   mkdir /etc/default &&
  #   touch /etc/default/useradd /etc/login.defs &&
  #   echo -e "/bin/bash\n" | lchsh root &&
  #   echo 'dotenv' > .envrc &&
  #   direnv hook bash > .profile &&
  #   wget ${_artifact_url}.env &&
  #   direnv allow &&

  adduser -D -h /home/${_remote_user} \
    -u ${_remote_user_id} \
    -G ${_remote_group} \
    ${_remote_user} || true

  addgroup ${_remote_user} wheel || true

  su ${_remote_user} -c \
    "mkdir /home/${_remote_user}/.ssh || true &&
      cat /etc/id_rsa.pub \
      >> /home/${_remote_user}/.ssh/authorized_keys &&
      chmod go-rwx /home/${_remote_user}/.ssh/authorized_keys"
}
case "${1}" in
  stage2-delete)
    echo "__TOFIX: /usr/bin/env bash ${0} stage2" \
      && /usr/bin/env bash "${0}" stage2

    delgroup ${_remote_user} ${_remote_group} \
      && deluser --remove-home ${_remote_user} \
      && /usr/bin/env bash "${0}" stage2
    ;;
  *)
    apk_repo_add

    # APK Dependencies
    # Ansible: openssh-client python
    # docker{-compose},cloud-init@community repo

    if [ "$(hostname)" = 'skull-vm-dev' ] \
      && [ "$(grep -c '3.13.' /etc/alpine-release)" -gt 0 ]; then
      apk add cloud-init util-linux \
        && setup-cloud-init
    else
      remote_user_group_add
      # shellcheck disable=SC2039
      # shellcheck disable=SC2015
      echo -e "\n$0: done!" >> /etc/motd \
        && tail -n 1 /etc/motd \
        && rm -f .env || true
    fi

    # shellcheck disable=SC2016
    apk add openssh-client python3 \
      && echo 'TODO: echo "${_remote_root_password}" | chpasswd' \
      && cat /etc/alpine-release >> /etc/motd \
      && mv /etc/profile.d/color_prompt /etc/profile.d/color_prompt.sh

    # https://wiki.syslinux.org/wiki/index.php?title=Config#GLOBAL_DIRECTIVES_-_SECONDARY
    echo 'TIMEOUT 15' >> /boot/extlinux.conf

    echo && df -hT | grep -e Size -e da
    #rm -f /etc/post.sh /etc/id_rsa.pub || true
    ;;
esac

```

My OS install was reproducible in development on a VM, so I worked to use these procedures to reinstall on my "production" hardware. I had to understand disk configuration (software RAID-1) and create conditional configuration steps for production with a related production answer file. With each production reinstall, more work was captured in git, and I finally had a reproducible pet in production!

## Configuration Management

It was time to re-acquaint myself with [Ansible](https://www.ansible.com/), I had not used it for years! It seemed that a few major changes had happened and another major change was about to land in 10.x, so I attempted to adopt newer techniques when possible.

I designated my Desktop to be an Ansible controller with `brew install ansible ansible-lint` -- it was easy to reference both `ansible-doc` and web site documentation to develop a playbook and leverage roles and collections from [Ansible Galaxy](https://galaxy.ansible.com/).

I created a simple Ansible YAML inventory of my production server and development VMs, then worked inside the playbook to configure each. I would SSH to a server only to troubleshoot issues and then re-run the playbook from the controller. As I got more comfortable with Ansible, I relied less on creating new shell and command tasks and tried to leverage built-in and community roles, loops, and conditionals.

I created these shell functions to speed my development cycle: the following will check the syntax of a playbook (if the `${PLAYBOOK}` variable isn't defined, it defaults to `playbook.yml`) and then run the playbook with variables converted from the `.env` file.

After I populate the `.env` file with variable keys and values, I type  `lint-playbook` and we've started another development lifecycle test and run. I've previously used a file watcher to trigger runs, but I found a new system, didn't get it working, and didn't need it enough to justify further effort because `!!` is simple enough to re-run the previous command!

```shell
$ cat .env
PLAYBOOK=playbook.yml
_remote_home='/home'
_remote_mode='u+rw,go-rwx'
_remote_user='ansible'


function dotenv2keypair() {
  local _delimiter=' '
  local _hold
  local _key_value_pair

  while read -r _key_value_pair; do
    _hold+="${_key_value_pair}${_delimiter}"
  done < .env

  echo "${_hold:0:-1}"
}

alias lint-playbook='ansible-lint ${PLAYBOOK:-playbook.yml}
  && ansible-playbook $_ --extra-vars "$(dotenv2keypair)"'

$ head playbook.yml

- name: "Web host: monolithic"
  hosts: dev
  remote_user: "{{ _remote_user }}"

  vars:
    _destination_filespec: "{{ _remote_home }}/{{ _remote_user }}/"

  tasks:
  - name: "Install package(s)"
    become: true
    community.general.apk:
      name: bash, git, jq, rsync, tree
      # Bootstrap: assume community repo enabled during alpine/post.sh, unsure of dependency
      state: present
      # update_cache: yes
      # state: latest


```

There are three community [Alpine specific Ansible modules](https://docs.ansible.com/ansible/latest/collections/community/general/apk_module.html), I used `apk` and discovered many Alpine tested Galaxy roles. Like all communities, each collection and role varies in quality, scope, assumptions, and maintenance. I also contributed to the AlpineLinux wiki a little bit!

## VM Artifacts

[Packer](https://www.packer.io) is another fabulous HashiCorp open-source DevOps tool  I had not used in years!  I mentioned Vagrant earlier, also by HashiCorp, as an experiment. When coupled with the open source [QEMU](https://www.qemu.org/) project, Packer can build customized VM images.

After finding an [Alpine wiki guide](https://wiki.alpinelinux.org/wiki/Packer_installation), some other [Packer QEMU OS examples](https://github.com/jakobadam/packer-qemu-templates), and following the [QEMU Builder documentation](https://www.packer.io/docs/builders/qemu), I made a Packer `qemu.json` file which performs:

1. Pull in enviroment variables
2. Use the QEMU builder:
   1. Boot the AlpineLinux ISO
   2. Provide a web server for file transfer
   3. Perform the bootstrapping steps to leverage my `init.sh` installation script
3. Provision: Wait for reboot and use SSH to perform my `post.sh` post-deployment script
4. Post-process:
   1. Create a new VM image artifact in QCOW2 format
   2. Compress, checksum, create an artifact manifest, upload to artifact repository or upload to AHV Image Service in Prism Central.

Writing JSON from scratch, even when cutting and pasting in examples, is easy to make mistakes: a good JSON lint package for my IDE was a continual life-saver to keep valid syntax. Here is a snapshot of the current file, I've nearly refactored out all of the hard-coded values:

```yaml
 {
  "variables": {
    "boot_key_interval": "{{env `boot_key_interval`}}",
    "boot_wait": "{{env `boot_wait`}}",
    "disk_size": "{{env `disk_size`}}",
    "format": "{{env `format`}}",
    "iso_url": "{{env `iso_url`}}",
    "iso_checksum": "{{env `iso_checksum`}}",
    "remote_user": "{{env `remote_user`}}",
    "remote_password": "{{env `remote_password`}}",
    "ssh_timeout": "{{env `ssh_timeout`}}",
    "vm_name": "{{env `vm_name`}}"
  },

  "builders": [
    {
      "type": "qemu",
      "accelerator": "kvm",
      "format": "{{user `format`}}",
      "http_directory": "../",
      "output_directory": "packer_cache/bin",
      "iso_url": "{{user `iso_url`}}",
      "iso_checksum": "{{user `iso_checksum`}}",
      "vm_name": "{{user `vm_name`}}.{{user `format`}}",
      "disk_interface": "virtio",
      "disk_size": "{{user `disk_size`}}",
      "net_device": "virtio-net",
      "ssh_timeout": "{{user `ssh_timeout`}}",
      "ssh_username": "{{user `remote_user`}}",
      "ssh_password": "{{user `remote_password`}}",
      "ssh_certificate_file": "~/.ssh/id_rsa.pem",
      "shutdown_command": "echo 'packer' | sudo -S poweroff",
      "boot_wait": "{{user `boot_wait`}}",
      "boot_key_interval": "{{user `boot_key_interval`}}",
      "boot_command": [
        "{{user `remote_user`}}<enter><wait>",
        "passwd<enter><wait1>{{user `remote_password`}}<enter>{{user `remote_password`}}<enter>",
        "KEYMAPOPTS='us us' setup-alpine -q ; hostname {{user `vm_name`}}<enter>",
        "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/id_rsa.pub -O /etc/id_rsa.pub<enter>",
        "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/answerfile/{{user `vm_name`}}.toml<enter><wait>",
        "wget http://{{ .HTTPIP }}:{{ .HTTPPort }}/bootstrap.sh -O - | sh<enter>"
      ]
    }
  ],

  "provisioners": [
    {
      "type": "shell",
      "script": "../post.sh"
    }
  ],

  "post-processors": [
    {
      "type": "manifest"
    },
    {
      "type": "shell-local",
      "script": "post-processor.sh"
    }
  ]
}

```

Now I have reproducible, lightly customized VM images ready for Configuration Management and further development. Cloud-init will be a welcome replacement for the Packer+QEMU work (it has entered into the Alpine community repo since I started this project), but the entire exercise has refreshed my knowledge with these great tools, leverage my previous work, and form a flexible foundation for moving forward. Another plus is that it was trivial to switch to a new release of Alpine Linux (3.13.0), use the smaller and faster 43 MB Virtual image ISO (rather than the 525MB 3.12.3 extended ISO I started with), and my post-process custom image compressed to 63MB! I will use that QCOW2 image with Nutanix AHV and convert it to VMDK for VirtualBox development.

# Epilog

My holiday project has spilled over into all of January, but I've enjoyed it immensely, sometimes waking up to work on it or not able to fall asleep without sorting out my next experiment for a feature or blocker! I've used it to upskill my shell scripting and programming knowledge, refresh my Ansible and Packer skills, push VirtualBox and QEMU forward, drive towards QCOW2 and AHV, all while reaffirming my love of Linux with Alpine.

I hope you've seen some of my development best practices and strategies, I try to set small goals that achieve strategic wins. Because this was a personal project, I lavished a lot of time on [yak shaving](https://en.wiktionary.org/wiki/yak_shaving) which helped me learn and improve my skills and procedures, while refactoring and reorganizing my work to reduce tech debt and toil. I made short experiments that were dead-ends or that were too challenging for me to be productive, so I would research an alternative and try a quick experiment with it for a win. When I found the alternative lacking, it justified turning back to rededicate time to pursue a discarded path. I tried to be agile, not loyal, to any facility.

- It is worth investing time on making your development cycle (change, build, test, report) easy and fast:
  - Use file format Linting inside your editor, because it:
    - cuts down on mistakes as I learned configuration syntax for AlpineLinux, Ansible, and Packer and my shell scripts for different shells
    - prevents finding mistakes later during build and test, every context switch out of the editor costs you time and focus and fixing mistakes later is more resource costly
    - can be even better to use specific language (Ansible, Packer, Vagrant) editor linters, but YAML, TOML, and JSON are fundamental substitutes you should already have to fall back on or seek to establish for any new facility configuration!
  - Try to make as simple as possible, a build and test change procedure:
    - Ideal for a 1-click or a simple CLI command:
      - make the command less characters by using a shell alias, function, or script to cut down on human error and parameters
      - even more ideal to setup a file watcher or IDE plugin to build and test automatically (0-click)
      - many of these facilities can be re-used later in CI/CD build and testing
      - make the procedure environment variable driven with DirEnv or `.env` file reuse to further cut down on human error
    - Always use facility linting as a second check before execution:
      - work to reduce and eventually remove any exceptions and warnings
  - Optimize the entire cycle to be minimal on resources, therefore faster to synthesize an ephemeral instance or provision a test
    - the smaller the time (and distance) between your change and a build+test result, the better = agility and #fastfeedback is important for developer flow
  - All of the above supports *red-green-refactor*, a development cycle pattern to keep your work in an optimal working state!

- Make your work reproducable:
  - Script your PetOps, save your work in git, share your work from git!
  - Virtualization is cheap: I used two providers over the course of this project to work on virtual machine guests for development, make mistakes and learn on them: **#failfastfixfast**!
- Don't over-rotate on custom work for a single facility if you can avoid it:
  - Sprint to establish a beach head with pet ops and hard coded work
    - Relentlessly re-factor your work to use variables and scripted procedures
    - Refactor scripts to facilities
  - Each stage helps you understand the full system and reorganize information appropriately while reducing tech debt
    - I loved that my `post.sh` was reused by Packer, that my `vm-init.sh` arrived at the same place as Packer using HTTP for basic file transfer without adding more facilities to the OS,
    - I tried to leverage environment variables in all facilities (Docker, Vagrant, Ansible, shell scripts) to remove hard-coded values and increase re-use across facilities.

Finally, you haven't seen the services I'm working on, that'll be for the future. There is so much bootstrapping, research, and discovery involved with each that I'm still evaluating alternatives based upon support and documentation, when I'm not helping improve the docs and filing bugs as well!

# Postscript: Patterns (TODO)

- Development pattern: Red -> Green -> Refactor (repeat)
- My research and development process over time was Alpine -> Ansible -> VirtualBox -> Packer -> QEMU, but my work process is focused on either:
  - Alpine -> Packer -> QEMU -> VirtualBox and Artifact pipeline
  - VirtualBox -> Ansible for container service development
