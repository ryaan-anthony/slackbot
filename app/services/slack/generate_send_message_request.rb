module Slack
  class GenerateSendMessageRequest
    def initialize(channel)
      @api_token = ENV['SLACK_API_TOKEN']
      @channel = channel
      @icon_url = Rails.application.config.romui_icon
    end

    def call(title, message)
      {
        token: @api_token,
        channel: @channel,
        username: title,
        icon_url: @icon_url,
        text: message
      }
    end
  end
end
