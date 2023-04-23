source 'https://rubygems.org'
ruby '3.2.2'

gem 'jsonapi-resources'

gem 'rails', '~> 7.0'
gem 'responders', '~> 3.0'
gem 'bootsnap', require: false

# DBs
gem 'pg', '~> 1.1'

# Photos
gem 'cloudinary'

# Authorization
gem 'bcrypt'

# Mapping
gem 'geocoder'

# Validations
gem 'auto_strip_attributes'

# Authorization
gem 'pundit'
gem 'jwt', '~> 1.5', '>= 1.5.3'

gem 'kaminari'

gem 'slack-ruby-client'

gem 'unicorn'

# Modern CORS solution
gem 'rack-cors'

# needed for ruby 2.7
gem 'e2mmap'
gem 'scanf'
gem 'thwait'

gem 'dotenv-rails', groups: [:development, :test]
gem 'listen', '>= 3.0.5', '< 3.2', groups: [:development]

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'rubocop'
  gem 'rspec-rails'
  gem 'pry-rails'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
end
