class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private
  
  def get_user
    @user = User.find(params[:id])
  end
  
  def get_hidden_user
    User.find(params[:from_there])
  end

  def set_page_number
    if params[:page].nil?
      params[:page] = 1
    end
    @page = params[:page].to_i
  end

  
end
