class RequestsController < ApplicationController
  def index
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
  end

  private
    def request_params
       params.require(:request).permit(:name, :datetime, :comment)
    end
end
