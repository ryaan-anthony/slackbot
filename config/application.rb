require_relative 'boot'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'
Bundler.require(*Rails.groups)

class Application < Rails::Application
  config.log_level = :debug
  config.romui_icon = 'https://s3-us-west-2.amazonaws.com/slack-files2/bot_icons/2017-01-14/127720882804_48.png'
end
