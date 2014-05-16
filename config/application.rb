require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module StripeSample
  class Application < Rails::Application
    config.assets.paths << Rails.root.join('vendor', 'assets', 'font')
    config.assets.paths << Rails.root.join('vendor', 'assets', 'images')

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.generators.stylesheets = false
    config.generators.javascript = false
    config.generators.helper = false
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Request-Method' => '*'
    }
    
    config.action_mailer.postmark_settings = { :api_key => ENV['POSTMARK_API_KEY'] }
  
  end
end
