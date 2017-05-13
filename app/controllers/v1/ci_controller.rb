module V1
  class CiController < ApplicationController
    include Concerns::Operations

    def build
      channel = '#sandbox'
      message = 'test' # TODO: Messages
      if event.broken?
        Slack::SendMessage.call(channel, 'Build is broken', message)
      elsif event.fixed?
        Slack::SendMessage.call(channel, 'Build is fixed', message)
      end
      operation_success!
    end

    def deploy
      operation_success!
    end

    private

    def event
      @event ||= GocdEvent.new(request.headers['X-Gocd-Event'])
    end
  end
end
