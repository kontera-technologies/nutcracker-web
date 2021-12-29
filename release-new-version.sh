#!/usr/bin/env bash
set -e

################################################################################
# Release new version:
# This script will bump the version number by 0.0.1 by default (by 0.1 if called
# with minor and by 1 if called with major).
# Examples:
# $ ./release-new-version.sh minor
#
#   Bumping nutcracker-web from version 1.0.2 to 1.1.0
#   Changing version in lib/nutcracker-web/version.rb from 1.0.2 to 1.1.0
#
#   Staging lib/nutcracker-web/version.rb
#   $ git add lib/nutcracker-web/version.rb
#
#   Creating commit
#   $ git commit -m "Bump nutcracker-web to 1.1.0"
#   [master 52b9409] Bump nutcracker-web to 1.1.0
#    1 file changed, 1 insertion(+), 1 deletion(-)
#
#   All is good, thanks my friend.
#
#     Successfully built RubyGem
#     Name: nutcracker-web
#     Version: 1.1.0
#     File: nutcracker-web-1.1.0.gem
#   Pushing nutcracker-web-1.1.0.gem to https://rubygems.org/...
#   Gem nutcracker-web-1.1.0.gem received and indexed.
################################################################################

BRANCH=$(git rev-parse --abbrev-ref HEAD)
if ![[ "$BRANCH" = "master" ]]; then
  echo 'To release a new version, checkout the master branch.';
  exit 1;
fi

# Pull the latest changes.
git pull

# Make sure all of the development requirements are installed.
bundle install

# Bump the version of this gem.
gem bump -v ${1:-"patch"}

# Push the new version number.
git push

gem tag -p

# Build the gem file.
# output=$(gem build nutcracker-web)
# echo "$output"

# Upload the new version.
# file=$(echo "$output" | grep "File" | awk -F':' '{ print $2 }')
gem release

# Remove the created gem.
# rm -f $file
