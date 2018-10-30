require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application

    VERSION = '1.0.0'
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.timezone = 'Ekaterinburg'
    #http://rusrails.ru/rails-internationalization-i18n-api
    I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
    I18n.available_locales = [:ru]
    I18n.default_locale = :ru

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
