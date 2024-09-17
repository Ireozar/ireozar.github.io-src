#!/bin/sh

cd "$(dirname "$0")"
git add .
git commit -m "$(read -p "Commit message: " -r && echo $REPLY)"
git push -u origin main
