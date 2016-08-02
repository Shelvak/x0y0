source 'https://rubygems.org'

gem 'rails', '~> 5.0'

gem 'pg'
gem 'kaminari'
gem 'simple_form'
gem 'paper_trail'
gem 'validates_timeliness'

# Auth & Mailing Gems
gem 'devise'
gem 'devise-async'
gem 'cancancan'
gem 'role_model'
gem 'sidekiq'
# needed for sidekiq-web
gem 'sinatra', github: 'sinatra/sinatra', require: false
gem 'rack-protection', github: 'sinatra/rack-protection', require: false

# Assets group
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'turbolinks'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'underscore-rails'

group :development, :test do
  gem 'byebug'
end

# Helpers (at console)
gem 'interactive_editor'
gem 'awesome_print'


group :development do
  gem 'thin'
  gem 'web-console', '~> 2.0'
  gem 'listen'

  # Deploy gems
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-chruby'
  gem 'capistrano-sidekiq'
end

group :test do
  gem 'capybara', require: false
  gem 'selenium-webdriver', require: false
  gem 'database_cleaner', require: false
  gem 'capybara-screenshot', require: false
  gem 'chromedriver-helper', require: false

  gem 'minitest-reporters'
  gem 'rails-controller-testing' # Mother of God

  gem 'fabrication'
  gem 'faker'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
