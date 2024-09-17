#!/bin/bash

mdbook build ~/world/wiki/
mv ~/world/wiki_pages/.git ~/world/wiki/git_files/.git
rm -rf ~/world/wiki_pages/*
mv ~/world/wiki/book/* ~/world/wiki_pages/.
mv ~/world/wiki/git_files/.git ~/world/wiki_pages/.git
