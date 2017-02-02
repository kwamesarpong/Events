class UsersController < ApplicationController

  #include ApplicationHelper

  before_action :get_user, only: [:show, :update, :destroy]


  def index
  end

  def show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(white_list)
    if @user.save
      #USER CREATED
      #puts display_object_attributes @user
      if @user.kind == User::SERVICE_PROVIDER
        #USER IS SERVICE PROVIDER
        redirect_to controller: :profiles, action: :new, from_there: @user.id
      else
        #USER IS ORGANIZER
        redirect_to action: :index
      end
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private

  def white_list
    params.require(:user).permit(:email,:username,:password,:kind,:first_name,:last_name)
  end
end
