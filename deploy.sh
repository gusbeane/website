#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# pull any necessary changes
cd public
git pull
cd ../

# Buld CV
cd static/cv
tectonic beane_cv.tex
cd ../../

# Buld secret CV
# cd static/secret-cv
# tectonic beane_cv.tex
# cd ../../

# Build the project.
hugo -t hugo-coder # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
#if [ $# -eq 1 ]
#  then msg="$1"
#fi
git commit -m "$msg"

# Push source and build repos.
#git push origin master
git push

# Come Back up to the Project Root
cd ..

# Update website repo
git add *
git commit -m "$msg"
git push origin main
