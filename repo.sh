#!/bin/bash
#
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/bzzlab/M347im_Code.git
git push -u origin main