module V1
  class CiController < ApplicationController
    include Concerns::Operations

    SLACK_CHANNEL = '#sandbox'

    def build
      author = params.require(:author)
      commit = params.require(:commit)
      if event.fail?
        fail_message = "Hey #{author}, your last commit just broke the build! \n #{commit} \n <#{RandomImage.fail!}|How does that make you feel?>"
        Slack::SendMessage.call(SLACK_CHANNEL, 'Build is broken', fail_message)
      elsif event.success?
        success_message = "Congrats #{author}, you just fixed the build! \n #{commit} \n <#{RandomImage.success!}|How does that make you feel?>"
        Slack::SendMessage.call(SLACK_CHANNEL, 'Build is fixed', success_message)
      end
      operation_success!
    end

    def deploy
      environment = params.require(:environment)
      title = "Latest deployment to #{environment}"
      if event.fail?
        message = '*Deployment failed, please check pipeline!*'
        Slack::SendMessage.call(SLACK_CHANNEL, title, message)
      elsif event.success?
        commit = params.require(:commit)
        Slack::SendMessage.call(SLACK_CHANNEL, title, commit)
      end
      operation_success!
    end

    private

    def event
      @event ||= CiEvent.new(request)
    end
  end
end
