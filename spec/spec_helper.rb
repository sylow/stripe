require 'database_cleaner'
require 'spork'
require 'stripe_mock'
require 'fabricate'
require "rails/application"
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
I18n.enforce_available_locales = false

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean_with(:truncation)

RSpec.configure do |config|
  config.mock_with :mocha
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.infer_base_class_for_anonymous_controllers = false
end

Spork.each_run do
  DatabaseCleaner.clean
end
