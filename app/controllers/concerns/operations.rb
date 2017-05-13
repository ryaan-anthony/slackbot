module Concerns::Operations
  extend ActiveSupport::Concern

  protected

  def operation_success!
    render json: {success: true}
  end
end
