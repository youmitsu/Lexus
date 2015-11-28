class TopController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    unless user_signed_in?
      render layout: 'gtop'
    end
  end

end
