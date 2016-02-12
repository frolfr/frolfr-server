source 'https://rubygems.org'
ruby '2.2.3'

gem 'jsonapi-resources'

gem 'rails', '~>4.2.4'
gem 'unicorn'
gem 'responders', '~> 2.0'

# DBs
gem 'pg'

# Photos
gem 'cloudinary'

# Pinging Heroku
gem 'newrelic_rpm'

# Authorization
gem 'bcrypt'

# Factories
gem 'factory_girl_rails'

# Mapping
gem 'geocoder'

# Validations
gem 'auto_strip_attributes'

# Serializers
gem 'active_model_serializers'

# Authorization
gem 'pundit'

# Coverage
gem 'coveralls', require: false
gem 'simplecov', '~> 0.7.1'

gem 'kaminari'

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'pry'
  gem 'pry-rails'
  gem 'database_cleaner'
  gem 'teaspoon'
end

group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'turnip'
  gem 'rspec-pride'
  gem 'launchy'
end
