#!/bin/sh

# Exit if any subcommand fails
set -e
cd $GITHUB_WORKSPACE

if [ -f "Gemfile" ]; then
  echo "# Bundling..."
  gem install bundler -v '< 2'
  bundle install --deployment --jobs 4 --retry 3
fi

export RAILS_ENV=test
rspec spec ./spec/controllers/admin/blog_entries_controller_spec.rb
#rake ci:setup:rspec ./spec/controllers/admin/blog_entries_controller_spec.rb --trace || true
