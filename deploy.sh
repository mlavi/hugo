#!/usr/bin/env bash
set -e # halt script on error
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

if [[ ! -f bugs.yaml ]]; then
  TEST=1
fi

# https://help.github.com/articles/adding-a-cname-file-to-your-repository/
# http://jekyllrb.com/docs/continuous-integration/
# http://gohugo.io/tutorials/github-pages-blog/

echo -e "\nSTART: Spell check contents..."
find content -name "*.md" -execdir aspell --mode=html --warn check {} \;
find content -name "*.md.bak" -delete
find content -name "*~" -delete
echo 'TODO: grep -R -e "/`grep status archetypes/default.md`/" content/'

echo -e "\nSTART: building project..."
rm -rf public/*
hugo --verbose
if [[ $? > 0 ]]; then
  echo "ERROR: build, exiting."; exit 1;
fi

# Test the generated HTML
# https://github.com/gjtorikian/html-proofer
if [[ ${TEST} ]]; then
  echo -e "\nSTART: test..."
  bundle exec htmlproof --verbose ./public
  if [[ $? > 0 ]]; then
    echo "ERROR: test, exiting."; exit 1;
  fi
else
  echo -e "\n SKIP: test..."
fi

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Commit changes.
cd public && git add --all
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push --force-with-lease origin master
cd ..
