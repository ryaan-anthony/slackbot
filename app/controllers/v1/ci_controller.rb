module V1
  class CiController < ApplicationController
    include Concerns::Operations
    def build
      operation_success!
    end
    def deploy
      operation_success!
    end
  end
end
