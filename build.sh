#!/bin/sh

cd "$(dirname "$0")"
if [ ! -d ../wiki_pages ]; then
  git clone https://github.com/ireozar/ireozar.github.io.git ../wiki_pages
fi
mdbook build
mv ../wiki_pages/.git git_files/.git
rm -rf ../wiki_pages/*
mv book/* ../wiki_pages/.
mv git_files/.git ../wiki_pages/.git
