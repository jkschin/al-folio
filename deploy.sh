#!/bin/bash

# Exit if any subcommand fails
set -e

# Build the site
bundle exec jekyll build

# Save current branch
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Force delete the gh-pages branch both locally and remotely
git branch -D gh-pages

# Create a new gh-pages branch from master
git checkout -b gh-pages

# Copy the built site to the root of the new branch
cp -r _site/* .

# Add all the changes
git add --all

# Commit the changes
git commit -m "Deploy site to gh-pages"

# Add the remote origin if it's not already added
git remote add origin git@github.com:jkschin/jkschin.github.io.git || true

# Force push the gh-pages branch to the remote repository
git push -f origin gh-pages

# Switch back to the original branch
git checkout $current_branch

