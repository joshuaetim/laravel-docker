#!/bin/bash

git add .
echo "Enter commit message >> "
read commit
git commit -m "$commit"
git push origin main