require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
module InstaApp
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.load_defaults 5.2
    config.generators do |g|
      g.assets false
      g.helper false
    end
  end
end
