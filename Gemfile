source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '>= 3.12.2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'rails_best_practices', require: false
  gem 'rubocop', require: false
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'letter_opener_web'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '~> 2.15.2'
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 4.10.0'
  gem 'launchy', '~> 2.4.3'
  gem 'rspec-rails', '~> 3.6'
  gem 'rspec_junit_formatter'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'webdrivers', '~> 3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootstrap', '>= 4.3.1'

gem 'cells-erb'
gem 'cells-rails'
gem 'font-awesome-sass'
gem 'jquery-rails'
gem 'redcarpet'
gem 'simple_calendar'
gem 'simple_form'

# Authentication
gem 'email_validator'
gem 'sorcery'

# Configuration
gem 'config'
gem 'dotenv-rails', require: 'dotenv/rails-now'

# Internationalization
gem 'rails-i18n'

# Editor
gem 'medium-editor-insert-plugin-rails'
gem 'medium-editor-rails'

# Image Upload
gem 'carrierwave'
gem 'fog-aws'
gem 'mini_magick'

# Pagination
gem 'kaminari'
gem 'kaminari-i18n'

# Search
gem 'ransack'

# SEO
gem 'google-analytics-rails'
gem 'gretel'
gem 'meta-tags'
gem 'sitemap_generator'

# Security
gem 'rack-attack'

# Map
gem 'geocoder'
gem 'gmaps4rails'

# Chart
gem 'chartkick'
gem 'groupdate'

# Notification
gem 'exception_notification'
gem 'slack-notifier'
