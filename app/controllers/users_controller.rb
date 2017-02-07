class UsersController < ApplicationController

  #include ApplicationHelper

  layout :set_layout
  
  before_action :get_user, only: [:show, :update, :destroy]


  def index
  end

  def show
  end

  def new
    @categories = Category.all
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
        profile = Profile.new
        profile.user_id = @user.id
        profile.name_of_agency = "Name Of Agency"
        profile.subscription_id = 3
        profile.desc = "A short description here"
        profile.paid = false
        if profile.save
          redirect_to controller: :profiles, action: :new, from_there: profile.id
        end
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

  def set_layout
    case action_name
      when "new"
        "no_search"
      else
        "application"
    end
  end

end
