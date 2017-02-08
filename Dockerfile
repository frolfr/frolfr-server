# Base image
# Based on http://chrisstump.online/2016/02/20/docker-existing-rails-application/
FROM ruby:2.3.1-slim

# Install packages
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client

# Where the app will live inside the image
ENV RAILS_ROOT /var/www/frolfr-server

# Create app home
RUN mkdir -p $RAILS_ROOT/tmp/pids

# Set working dir inside image
WORKDIR $RAILS_ROOT

# Use the Gemfiles as Docker cache markers. Always bundle before copying app src.
# (the src likely changed and we don't want to invalidate Docker's cache too early)
# http://ilikestuffblog.com/2014/01/06/how-to-skip-bundle-install-when-deploying-a-rails-app-to-docker/
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

# Install bundler
RUN gem install bundler

# Install deps
RUN bundle install

# Copy the app
COPY . .

# script that runs when the container boots
CMD [ "config/containers/app_cmd.sh" ]
