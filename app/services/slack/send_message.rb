module Slack
  class SendMessage
    def self.call(channel, title, message)
      request = GenerateSendMessageRequest.new(channel).call(title, message)
      response = SlackApiClient.new.send_message(request)
      Rails.logger.debug response.body
    end
  end
end
