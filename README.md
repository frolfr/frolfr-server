# Frolfr

[![Code Climate](https://codeclimate.com/github/gschorkopf/frolfr.png)](https://codeclimate.com/github/gschorkopf/frolfr)
[![Coverage Status](https://coveralls.io/repos/gschorkopf/frolfr/badge.png?branch=master)](https://coveralls.io/r/gschorkopf/frolfr?branch=master)
[![Build Status](https://travis-ci.org/gschorkopf/frolfr.png)](https://travis-ci.org/gschorkopf/frolfr)

#### About Frolfr

This project is under construction. The Rails MVP, however, is currently available at the production site below. **Please note: The production site is not currently up-to-date with the master branch. We are currently rebuilding the site using the Ember.js framework.**

#### Visit Frolfr's production site

Production server is available at [frolfr.com](http://frolfr.com).

#### Install Frolfr locally

To install and deploy:
* Pull down repository
* `bundle install`
* `rake db:create:all`
* `rake db:schema:load`
* `rake db:seed`
* `bundle exec unicorn`

To run tests, run `rake db:test:prepare; rspec`.

#### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

#### Contact

Feel free to contact me via Twitter: [Geoff Schorkopf](http://twitter.com/gschork)
