require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

class Application < Rails::Application
  config.log_level = :debug
end
