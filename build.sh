#!/bin/sh

cd "$(dirname "$0")"
if [ ! -d ../wiki_pages/.git ]; then
  read -p "Confirm downloading latest version: " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    git clone https://github.com/ireozar/ireozar.github.io.git ../wiki_pages
  else
    exit 1
  fi
fi
mdbook build
mv ../wiki_pages/.git git_files/.git
rm -rf ../wiki_pages/*
mv book/* ../wiki_pages/.
mv git_files/.git ../wiki_pages/.git
cd ../wiki_pages
read -p "Upload? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  git add .
  msg="$(read -p "Commit message: " -r && echo $REPLY)"
  if [[ -z $msg  ]]; then
    commit_msg="$(date +"%d.%m.%y %R") (script commit)"
  else
    commit_msg="$msg"
  fi
  git commit -m "$commit_msg"
  git push -u origin main
fi
