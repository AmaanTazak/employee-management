#!/usr/bin/env bash
# Exit on error
set -o errexit

# Ensure executables have the correct permissions
chmod +x bin/*

# Install dependencies
bundle install

# Precompile and clean assets
bundle exec rails assets:precompile
bundle exec rails assets:clean

# Run database migrations
bundle exec rails db:migrate
