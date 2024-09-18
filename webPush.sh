#!/bin/bash

cd "$(dirname "$0")"
git push
cd ../wiki_pages
git push
