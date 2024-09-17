#!/bin/sh

cd "$(dirname "$0")"
if [ ! -d ../wiki_pages/.git ]; then
  read -p "Confirm downloading latest version: " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    git clone https://github.com/ireozar/ireozar.github.io.git ../wiki_pages
  fi
fi
mdbook build
mv ../wiki_pages/.git git_files/.git
rm -rf ../wiki_pages/*
mv book/* ../wiki_pages/.
mv git_files/.git ../wiki_pages/.git
