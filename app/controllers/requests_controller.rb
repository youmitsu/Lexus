class RequestsController < ApplicationController
  def index
    #@requests = Request.page(params[:page])
    @q = Request.search(params[:q])
    @requests = @q.result(distinct: true).order(datetime: :desc)
  end

  def show
    @request = Request.find(params[:id])
    @receive = Receive.new
  end

  def new
    @request = Request.new
  end

  def edit
    @request = Request.new(params[:id])
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to controller: 'mypage', action: 'show'
  end

  def create
    @request = Request.new(request_params)
    if @request.save!
      redirect_to @request
    else
      render 'new'
    end
  end

  def receive
    @receive = Receive.new(receive_params)
    if @receive.save!
      redirect_to action: "thanks"
    else
      render 'show'
    end
  end

  def thanks
  end

  private
    def request_params
      params.require(:request).permit(:name, :datetime, :time, :comment, :request_user_id)
    end

    def receive_params
      params.require(:receive).permit(:request_id, :receive_user_id)
    end
end
