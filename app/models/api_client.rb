require 'faraday'

class ApiClient
  def initialize(url)
    @connection = Faraday.new(url)
  end

  def post(operation, request)
    Rails.logger.debug operation
    Rails.logger.debug request
    response = @connection.send('post', operation, request)
    Rails.logger.debug response.body
  end
end
