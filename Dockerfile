# Base image
# Based on http://chrisstump.online/2016/02/20/docker-existing-rails-application/
FROM ruby:2.5.3

WORKDIR /app

RUN mkdir -p /app/tmp/pids
RUN chmod 777 /app/tmp/pids

# Install packages
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client

# Use the Gemfiles as Docker cache markers. Always bundle before copying app src.
# (the src likely changed and we don't want to invalidate Docker's cache too early)
# http://ilikestuffblog.com/2014/01/06/how-to-skip-bundle-install-when-deploying-a-rails-app-to-docker/
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

# Install bundler
RUN gem install bundler:1.17.1

# Install deps
RUN bundle install

# Copy the app
ADD . /app

ENTRYPOINT ["/app/script/wait-for-it.sh", "postgres:5432", "--"]

# script that runs when the container boots
CMD ["script/server"]
