require 'faraday'

class ApiClient
  def initialize(url)
    @connection = Faraday.new(url)
  end

  def post(operation, request)
    @connection.send('post', operation, request)
  end
end
