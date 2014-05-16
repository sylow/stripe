source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem 'bootstrap-sass', '~> 3.1.1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

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

gem 'rabl'
gem 'oj'
gem 'slim-rails'

# authentication and omni auhhorization
gem 'devise'

# payments 
gem 'stripe'

# background processing
gem 'sidekiq'

group :production do
  gem 'rails_12factor'
end

gem 'dotenv-rails', :groups => [:development, :test]

group :production, :staging do
  gem 'dalli', '~> 1.1.4'
  gem 'memcachier', '~> 0.0.2'
  gem 'unicorn', require: nil
  gem 'unicorn-worker-killer', require: nil
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'railroady'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 2.0'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'spork-rails', github: 'sporkrb/spork-rails' # rubygems version not rails 4 compatible
  gem 'guard-spork'
  gem 'childprocess'
end

group :test do
  gem 'fabrication'
  gem 'forgery'
  gem 'mocha'
  gem 'database_cleaner'
end
# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
