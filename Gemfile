source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

group :development, :test do
	#### Use sqlite3 as the database for Active Record
	gem 'sqlite3'
end

group :production do
#### gem for using PostgreSQL db - Heroku uses PostgreSQL db
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'  #used by Heroku to serve static assets such as images and stylesheets
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

gem 'aws-sdk'
gem 'carrierwave-aws'
#gem 'carrierwave' # using carrierwave-aws instead
#gem 'fog' # using carrierwave-aws instead
gem 'zencoder'
gem 'jquery-fileupload-rails'

gem 'bootstrap-sass', '~> 2.3.2'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
