#!/usr/bin/env bash

echo http://atom.io
echo https://atom.io/packages

apm install language-bats && cat <<EoM
  brew install bats-core
  https://github.com/bats-core/bats-core
EoM
apm install atom-ide-ui && cat <<EoM
  https://github.com/facebook-atom/atom-ide-ui
EoM
npm i -g bash-language-server && apm install ide-bash ; cat <<EoM
  https://github.com/
EoM
apm install language-groovy # for Jenkinsfile http://groovy-lang.org/
apm install markdown-preview-enhanced && cat <<EoM
  disable markdown-preview first
  https://atom.io/packages/markdown-preview-enhanced
  https://shd101wyy.github.io/markdown-preview-enhanced/#/diagrams?id=plantuml
  https://atom.io/packages/atom-mermaid
EoM
cat <<-EoM
Python/etc. interactive environments/workbooks:

- https://atom.io/packages/Hydrogen
  - https://nteract.gitbooks.io/hydrogen/docs/Installation.html
  - http://ipython.org/
    - https://jupyter.readthedocs.io/en/latest/install.html
      - https://www.anaconda.com/download/#macos (Python 2.7 or 3.6 distro with easy package mgmt)

    - https://jupyter.readthedocs.io/en/latest/running.html#running
- anaconda Py2.7:
  conda install ipykernel
  python -m ipykernel install --user
  apm install hydrogen
- https://github.com/lgeiger/hydrogen-launcher
-
- http://xon.sh/

Next:
- https://atom.io/packages/git-time-machine
  - apm install git-time-machine # split-diff
- shellcheck? -- See CLI acceleration/research below.

Also installed:
- busy-signal
- intentions
Disabled:
- linter && linter-ui-default && markdown-preview
To investigate:
- https://github.com/mehcode/awesome-atom#emmet
- https://atom.io/packages/atom-clock
- https://atom.io/packages/hey-pane
  - https://atom.io/packages/script
  - https://atom.io/packages/platformio-ide-terminal
- https://atom.io/packages/git-blame
- apm install atom-mdtoc
  vs.: https://atom.io/packages/markdown-toc-auto || https://atom.io/packages/markdown-toc

CLI accelation/shell research:
- https://google.github.io/styleguide/shell.xml
- https://github.com/clvv/fasd

- curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add - \
  && sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'\
  && sudo apt-get update && sudo apt-get install atom gir1.2-gnomekeyring-1.0

- Shellcheck = https://github.com/koalaman/shellcheck
  - apm install linter && apm install linter-shellcheck # intentions, linter-ui, busysignal?
- https://github.com/mvdan/sh
  - https://github.com/mvdan/sh/releases | Download shfmt_v2.5.1_linux_amd64, where to put on path?
  - mkdir ~/bin || echo '~/bin already exists.' \
    && chmod u+x shfmt*linux_amd64 && mv shfmt*linux_amd64 ~/bin/ && pushd . \
    && pushd ~/bin && rm -f shfmt && ln -s shfmt*linux_amd64 shfmt && popd
  - apm install format-shell
    - shfmt -s -d -i 2 -kp -sr -ci -bn scripts/common.lib.sh | less # really dislikes padding spaces
    - made dotfiles/xps-mint/bin/shfmt-wrapper.sh
EoM
