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
export TZ="/usr/share/zoneinfo/America/New_York"
echo $ELASTICSEARCH_URL
curl -XGET 'elasticsearch:9200'
#bundle exec rails runner "require 'yaml' && YAML.dump(Rails.application.secrets)"
#bundle exec rails runner "require 'yaml' && YAML.dump(Rails.application.config)"
#bundle exec rspec ./spec/controllers/admin/blog_entries_controller_spec.rb
bundle exec rake ci:setup:rspec spec --trace
