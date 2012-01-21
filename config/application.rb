require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Ianphoto
  class Application < Rails::Application
    config.i18n.default_locale = :ru

    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    if Rails.env == "production"
      config.middleware.use("Rack::GoogleAnalytics", :web_property_id => SHADOW["ga_code"])
    end

    if Rails.env == "staging"
      config.action_mailer.delivery_method = :sendmail
      config.action_mailer.default_url_options = { :host => "178.79.162.196:8089" }
    end
  end
end
