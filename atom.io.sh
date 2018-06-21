#!/usr/bin/env bash

echo http://atom.io

apm install language-bats ; cat <<EoM
  brew install bats-core
  https://github.com/bats-core/bats-core
EoM
apm install atom-ide-ui ; cat <<EoM
  https://github.com/facebook-atom/atom-ide-ui
EoM
npm i -g bash-language-server ; apm install ide-bash ; cat <<EoM
  https://github.com/
EoM

cat <<EoM

Also installed:
- busy-signal
- intentions
Disabled:
- linter && linter-ui-default
To investigate:
- https://atom.io/packages/Hydrogen
- https://atom.io/packages/atom-clock
- https://atom.io/packages/hey-pane
EoM
