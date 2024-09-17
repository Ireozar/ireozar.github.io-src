#!/bin/sh

cd "$(dirname "$0")"
git add .
msg="$(read -p "Commit message: " -r && echo $REPLY)"
if [[ -z $msg  ]]; then
  commit_msg="$(date +"%d.%m.%y %R") (script commit)"
else
  commit_msg="$msg"
fi
git commit -m "$commit_msg"
git push -u origin main
