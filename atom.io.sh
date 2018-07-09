#!/usr/bin/env bash

echo http://atom.io

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

cat <<EoM

Also installed:
- busy-signal
- intentions
Disabled:
- linter && linter-ui-default && markdown-preview
To investigate:
- https://atom.io/packages/Hydrogen
- https://atom.io/packages/atom-clock
- https://atom.io/packages/hey-pane
  - https://atom.io/packages/script
  - https://atom.io/packages/platformio-ide-terminal
- https://atom.io/packages/git-time-machine
EoM
