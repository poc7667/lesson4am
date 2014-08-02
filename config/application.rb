require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

#Load secret setting
#Setting load ENV Variables
config = YAML.load(File.read(File.expand_path('../application.yml', __FILE__)))
config.merge! config.fetch(Rails.env, {})
config.each do | key, value|
        ENV[key] = value unless  value.kind_of? Hash
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Lesson4am
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.encoding = "utf-8"
    config.assets.paths << "#{Rails.root}/vendor/themes"
    config.assets.precompile += %w( vendor/themes/**/application.js )
    config.assets.precompile += %w( vendor/themes/**/application.css )
    config.assets.precompile += %w[*.png *.jpg *.jpeg *.gif]

    # Precompile *all* assets, except those that start with underscore
    config.assets.precompile << /(^[^_\/]|\/[^_])[^\/]*$/    
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.autoload_paths += %W(#{config.root}/lib)
  end
end
