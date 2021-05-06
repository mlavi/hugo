#!/usr/bin/env bash

set -e -x # halt script on error

# hugo server --watch &
#  Install hugo via brew
#  hugo version # https://github.com/spf13/hugo/releases
#  Install hugo theme:
#   cd themes; git clone https://github.com/tmaiaroto/hugo-redlounge
# git config --local --edit
#  hugo new post/name.md --editor=gedit &
# ____ Filesystem:
#  init a new working copy:
#  rm -rf public && git rm public # make idempotent
#  git submodule add --force https://github.com/mlavi/mlavi.github.io.git public
#  git submodule add --force git@github.com:mlavi/mlavi.github.io.git public
#  rm -rf public/*/* public/*.*; ./deploy.sh
# ____ Fish: function slides
#  cd ~/Documents/github.com/mlavi/hugo/static/slides
#  echo; pwd; ls
#  . landslide/bin/activate.fish
#  echo 'set PAGE x watchmedo shell-command --pattern="*.md" --command="landslide --relative --embed --quiet $PAGE.md --destination $PAGE.html" &'
# end

if [[ -f bugs.yaml ]]; then
  TEST=1
fi

# https://help.github.com/articles/adding-a-cname-file-to-your-repository/
# http://jekyllrb.com/docs/continuous-integration/
# http://gohugo.io/tutorials/github-pages-blog/

#echo -e "\nSTART: Spell check contents..."
#find content -name "*.md" -execdir aspell --mode=html --warn check {} \;

find content -name "*.md.bak" -delete
find content -name "*~" -delete

# grep --recursive -e png -e jpg -e jpeg -e gif content/ > bugs.txt

#_DRAFT=$(      grep --ignore-case --recursive 'draft' content/ | grep --ignore-case 'true') || true
_PLACEHOLDER=$(grep --ignore-case --recursive --extended-regexp 'Placeholder' content/) || true

if [[ ${_PLACEHOLDER} || ${_DRAFT} ]]; then
  echo "ERROR: found Placeholder or draft:true in content/"
  echo -e "${_PLACEHOLDER}\n${_DRAFT}\n"
  exit 8
fi

echo -e "\nSTART: building project..."
rm -rf public/*

if ! hugo --verbose; then
  echo "ERROR: hugo build, exiting."
  exit 9
fi

# Test the generated HTML
# https://github.com/gjtorikian/html-proofer
# sudo apt-get install -y ruby ruby-dev ruby-bundler
# sudo gem install html-proofer

# http://validator.w3.org/
if [[ ${TEST} ]]; then
  echo -e "\nSTART: test..."
  if ! bundle exec htmlproof --verbose ./public; then
    echo "ERROR: test, exiting."
    exit 1
  fi
else
  echo -e "\n SKIP: test..."
fi

echo -e "\033[0;32mCommit changes and deploying updates...\033[0m"

if [ $# -eq 1 ]; then
  msg="$1"
else
  msg="rebuilding site $(date)"
fi

cd public \
  && git add --all \
  && git commit -m "$msg" \
  && git push origin HEAD:master --force-with-lease
cd ..
