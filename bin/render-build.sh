#!/usr/bin/env bash
# exit on error
set -o errexit
#!/usr/bin/env bash
set -e
chmod +x bin/* # Ensure executables have the correct permissions


bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

# If you're using a Free instance type, you need to
# perform database migrations in the build command.
# Uncomment the following line:

 bundle exec rails db:migrate