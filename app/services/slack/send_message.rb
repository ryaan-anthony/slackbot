module Slack
  class SendMessage
    def self.call(channel, title, message)
      request = GenerateSendMessageRequest.new(channel).call(title, message)
      SlackApiClient.new.send_message(request)
    end
  end
end
