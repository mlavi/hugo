#!/usr/bin/env bash

echo http://atom.io
echo https://atom.io/packages

curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add - &&
  sudo    sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list' &&
  sudo    apt-get update && sudo apt-get -y install atom gir1.2-gnomekeyring-1.0
# add Atom to desktop: right click on Desktop, +Create a new launcher here... Seach for icon.

pushd ~/Documents/github.com/mlavi/hugo/drafts &&
  apm    list --bare --installed > atomfile-"$(uname -s)".txt && popd || exit

brew install shellcheck &&
  apm install linter && apm install linter-shellcheck && cat << EoM
  Dependencies post-installed: intentions, linter-ui, busysignal
  https://github.com/koalaman/shellcheck
  - https://github.com/koalaman/shellcheck/wiki/Contrib#docker-wrapper-script
EoM

brew install shfmt &&
  apm install format-shell && cat << EoM
- must set absolute filespec, I like show notifications and format on save.
  - made dotfiles/xps-mint/bin/shfmt-wrapper.sh
- https://github.com/mvdan/sh
  - brew install shfmt #desktop-mint, macbookair-mark
- https://atom.io/packages/format-shell # for shfmt
    - shfmt -s -d -i 2 -kp -sr -ci -bn scripts/common.lib.sh | less # really dislikes padding spaces
EoM

apm install markdown-preview-enhanced && cat << EoM
  https://atom.io/packages/markdown-preview-enhanced
  https://shd101wyy.github.io/markdown-preview-enhanced/#/diagrams?id=plantuml
  https://atom.io/packages/atom-mermaid
EoM

apm install atom-mdtoc && cat << EoM
  vs. https://atom.io/packages/markdown-toc-auto || https://atom.io/packages/markdown-toc
EoM

# tried on xps-mint only...
# see comments below for JSON: pretty-json and linter-jsonlint
apm install git-blame && cat << EoM
  https://atom.io/packages/git-blame
EoM
apm install termination && cat << EoM
  https://atom.io/packages/termination
  keeps a permanent tiny bottom strip, send feedback for movable?
EoM
# tried on Mac only...
apm install language-bats && cat << EoM
  echo Possibly redundant in consideration of the above, although missing function jump
  brew install bats-core
  https://github.com/f-core/bats-core
EoM
apm install atom-ide-ui && cat << EoM
  https://github.com/facebook-atom/atom-ide-ui
EoM
npm i -g bash-language-server && apm install ide-bash
cat                                                         << EoM
  https://github.com/
EoM

apm install language-groovy # for Jenkinsfile http://groovy-lang.org/

cat <<- EoM
- JSON:
  - https://atom.io/packages/pretty-json
  - apm install linter-jsonlint
    - https://atom.io/packages/linter-jsonlint

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
  - conda update conda && conda update anaconda
  - https://docs.anaconda.com/anaconda/user-guide/troubleshooting/#conda-update-anaconda-command-does-not-install-the-latest-version-of-anaconda
- https://github.com/lgeiger/hydrogen-launcher
- http://xon.sh/

apm install git-time-machine
  Dependencies: split-diff
  https://atom.io/packages/git-time-machine

apm install imdone-atom

Disabled:
- linter && linter-ui-default && markdown-preview
To investigate:
- https://github.com/mehcode/awesome-atom#emmet
- https://atom.io/packages/atom-clock
- https://atom.io/packages/hey-pane
  - https://atom.io/packages/script
- Term(s)/Terminal(s):
  - https://atom.io/packages/terminal-tab # simple
  - https://atom.io/packages/terminal-plus
    - fork: https://atom.io/packages/vk-terminal
    - fork: https://atom.io/packages/platformio-ide-terminal
      - fork: https://atom.io/packages/tokamak-terminal
      - fork: https://atom.io/packages/termination
  - https://atom.io/packages/atom-xterm # node-LTS dep
  - apm install atom-domterm && cat
    - https://atom.io/packages/atom-domterm # Fed29 tested
    - http://domterm.org/Downloading-and-building.html
  - https://atom.io/packages/terminal-commands
  - https://atom.io/packages/run-in-terminal

CLI accelation/shell research:
- https://google.github.io/styleguide/shell.xml
- https://github.com/clvv/fasd

EoM
