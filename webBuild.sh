#!/bin/bash

cd "$(dirname "$0")"
if [ ! -d ../../../wiki/.git ]; then
  exit 1
fi
../../mdbook build
mv ../../../wiki/.git git_files/.git
rm -rf ../../../wiki/*
mv book/* ../../../wiki/.
mv git_files/.git ../../../wiki/.git
cd ../../../wiki
git add .
commit_msg="$(date +"%d.%m.%y %R") (script commit)"
git commit -m "$commit_msg"
