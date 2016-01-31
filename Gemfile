source 'https://rubygems.org'

gem 'rails', '4.2.5'

gem 'pg'
gem 'kaminari'
gem 'simple_form'
gem 'paper_trail', '4.0.1'
gem 'magick_columns'
gem 'validates_timeliness'

# Auth & Mailing Gems
gem 'devise'
gem 'devise-async'
gem 'cancan'
gem 'role_model'
gem 'sidekiq'

# Assets group
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'bootstrap-material-design'

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'thin'
  gem 'web-console', '~> 2.0'

  # Deploy gems
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
end

group :test do
  gem 'selenium-webdriver', require: false
  gem 'capybara', require: false
  gem 'database_cleaner'
  gem 'fabrication'
  gem 'faker'
end
