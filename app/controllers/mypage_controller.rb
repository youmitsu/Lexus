class MypageController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @requesting = Request.where(request_user_id: params[:id]).where(commit_user_id: nil).order(datetime: :desc)
    @requested = Request.where(request_user_id: params[:id]).where.not(commit_user_id: nil).order(datetime: :desc)
    @receiveing = Receive.where(receive_user_id: params[:id]).select do |item|
      item.request.commit_user_id.nil?
    end
    @received = Receive.where(request_id: params[:id]).reject do |item|
      item.request.commit_user_id.nil?
    end
  end
end
