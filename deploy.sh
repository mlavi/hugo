#!/usr/bin/env bash
set -e # halt script on error

#TEST=1

# http://jekyllrb.com/docs/continuous-integration/
# http://gohugo.io/tutorials/github-pages-blog/

# Build the project. 

echo -e "\nSTART: build..."
rm -rf public/*
hugo --theme='hugo-redlounge'
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
git push origin master
cd ..
