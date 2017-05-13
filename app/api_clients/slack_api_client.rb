# API Documentation:
# https://api.slack.com/methods/chat.postMessage

class SlackApiClient < ApiClient
  def initialize
    super('https://slack.com/api')
  end

  def send_message(body)
    post('chat.postMessage', body)
  end
end
