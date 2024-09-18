#!/bin/bash

cd "$(dirname "$0")"
if [ ! -d ../wiki_pages/.git ]; then
  exit 1
fi
../../mdbook build
mv ../wiki_pages/.git git_files/.git
rm -rf ../wiki_pages/*
mv book/* ../wiki_pages/.
mv git_files/.git ../wiki_pages/.git
cd ../wiki_pages
git add .
commit_msg="$(date +"%d.%m.%y %R") (script commit)"
git commit -m "$commit_msg"
./../wiki/webPush.sh
