#!/bin/sh

# Exit if any subcommand fails
set -e
cd $GITHUB_WORKSPACE

if [ -f "Gemfile" ]; then
  echo "# Bundling..."
  bundle install --jobs 4 --retry 3
fi

gem install bundler -v 1.9.0
gem install bundler-audit -v 0.6.1
bundler-audit check $INPUT_ARGS