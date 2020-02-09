#!/usr/bin/env bash

set -e -x # halt script on error

# hugo server --watch &
#  Install hugo:
#  hugo version # https://github.com/spf13/hugo/releases
#   sudo apt-get remove hugo && sudo dpkg -i /home/mark/Downloads/hugo_0.17-64bit.deb && hugo version
#   vs. brew --version && brew update && brew upgrade
#    brew list ; brew cask list ; brew desc -n /libff*/
#  Install hugo theme:
#   cd themes; git clone https://github.com/tmaiaroto/hugo-redlounge
# git config --local --edit
#  hugo new post/name.md --editor=gedit &
# ____ Filesystem:
#  init a new working copy:
#  rm -rf public; git rm public # make idempotent
#  git submodule add --force git@github.com:mlavi/mlavi.github.io.git public
#  rm -rf public/*; ./deploy.sh
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
#
# Building native extensions. This could take a while...
# Successfully installed nokogiri-1.10.7
# Successfully installed nokogumbo-2.0.2
# Successfully installed parallel-1.19.1
# Successfully installed rainbow-3.0.0
# Successfully installed ffi-1.11.3
# Successfully installed ethon-0.12.0
# Successfully installed typhoeus-1.3.1
# Successfully installed yell-2.2.1
# Successfully installed html-proofer-3.15.0

# http://validator.w3.org/
if [[ ${TEST} ]]; then
  echo -e "\nSTART: test..."
  if ! bundle exec htmlproof --verbose ./public; then
    echo "ERROR: test, exiting."
    exit                               1
  fi
else
  echo -e "\n SKIP: test..."
fi

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Commit changes.
cd public && git add --all
msg="rebuilding site $(date)"
if [ $# -eq 1 ]; then
  msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin HEAD:master --force-with-lease
cd ..
