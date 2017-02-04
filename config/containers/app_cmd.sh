#!/usr/bin/env bash

# prefix bundle with exec so unicorn shuts down gracefully
exec bundle exec unicorn -c config/containers/unicorn.rb -E $RAILS_ENV;
