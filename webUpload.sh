#!/bin/bash

cd "$(dirname "$0")"
git add .
commit_msg="$(date +"%d.%m.%y %R") (script commit)"
git commit -m "$commit_msg"
git push
