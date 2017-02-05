# Frolfr

[![Code Climate](https://codeclimate.com/github/gschorkopf/frolfr.png)](https://codeclimate.com/github/gschorkopf/frolfr)
[![Coverage Status](https://coveralls.io/repos/gschorkopf/frolfr/badge.png?branch=master)](https://coveralls.io/r/gschorkopf/frolfr?branch=master)
[![Build Status](https://travis-ci.org/gschorkopf/frolfr.png)](https://travis-ci.org/gschorkopf/frolfr)

#### About Frolfr

This project is under construction. The MVP, however, is currently available at the production site below.

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

You'll need to configure cloudinary, [including adding a cloudinary.yml file](http://cloudinary.com/documentation/rails_integration).

#### Running Frolfr in Docker
If process isolation is your bag then you're in luck - the Frolfr API is full containerized! Make sure you have docker fully setup and running in your local environment and then do the following to get frolfr running:
```
# build images
docker-compose build

# start the containers
docker-compose up
```

You can now access the Frolfr API at 0.0.0.0!

If you want to develop on Frolfr in Docker you need to add a `docker-compose.override.yml` locally with the following contents:
```
app:
  # map our application source code, in full, to the application root of our container
  volumes:
    - .:/var/www/frolfr-server

web:
  # use whatever volumes are configured for the app container
  volumes_from:
    - app

```
This file is already in .gitignore so if you want to make local tweaks go nuts! An example tweak would be to add the following so you can access the DB from your local environment using a tool like [dbeaver](http://dbeaver.jkiss.org/):

```
db:
  ports:
    - 5432:5432
```

#### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

#### Contact

Feel free to contact me via Twitter: [Geoff Schorkopf](http://twitter.com/gschork)

#### About Frolf
[![frisbee golf, jerry.](http://img.youtube.com/vi/W_7iFIC2xWg/0.jpg)](http://www.youtube.com/watch?v=W_7iFIC2xWg)
