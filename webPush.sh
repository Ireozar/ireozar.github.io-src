#!/bin/bash

cd "$(dirname "$0")"
git push
cd ../../../wiki
git push
