require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module PocMail
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.assets.initialize_on_precompile = false


    # config.action_mailer.smtp_settings = {
    #   address:              'smtp.gmail.com',
    #   port:                 587,
    #   domain:               'poc-mail.herokuapp.com',
    #   user_name:            'alexandre.ktifa@gmail.com',
    #   password:             'fayabomboclatt',
    #   authentication:       :plain
    # }

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.default_url_options = { host: 'poc-mail.herokuapp.com' }
    config.action_mailer.smtp_settings = {
      user_name: ENV['STK_MAIL_USERNAME'],
      password: ENV['STK_MAIL_PASSWORD'],
      address: ENV['STK_MAIL_SERVER'],
      port: ENV['STK_MAIL_PORT'],
      domain: 'poc-mail.herokuapp.com',
      authentication: :plain
    }
  end
end
