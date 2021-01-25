#!/bin/sh

# Exit if any subcommand fails
set -e
cd $GITHUB_WORKSPACE

if [ -f "Gemfile" ]; then
  echo "# Bundling..."
  bundle install --deployment --jobs 4 --retry 3
fi

export RAILS_ENV=test
rake ci:setup:rspec spec --trace || true
