source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use sqlite3 as the database for Active Record for heroku
#gem 'sqlite3'
# Use SCSS for stylesheets
gem "bootstrap"
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem "knockoutjs-rails"
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'httparty'
gem 'oj'
gem 'ox'
gem 'mongo', '~> 2.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "meta_request"      #use me with https://github.com/dejan/rails_panel for chrome
  gem "powify"
  gem "pry-byebug"
  gem "pry-remote"
  gem "awesome_print",    :require => "ap"
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

ruby "2.1.6"