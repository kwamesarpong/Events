class UsersController < ApplicationController

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
      session[:user_id] = @user.id
      #USER CREATED
      #puts display_object_attributes @user
      if @user.kind == User::SERVICE_PROVIDER
        #USER IS SERVICE PROVIDER
        profile = Profile.new
        profile.user_id = @user.id
        profile.name_of_agency = "Name Of Agency"
        #make sure subcriptions are created beforehand
        profile.subscription_id = 1
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

 def attempt_login
    found_user = User.where(email: params[:email]).first
    #puts found_user
    if found_user
      authorized_user = found_user.authenticate(params[:password])
      #puts params[:password]
    end
  	if authorized_user
  		#mark user as logged in
  		session[:user_id] = authorized_user.id
  		flash[:notice] = "You are now logged in"
  		redirect_to "/"
  	else
  		flash[:notice] = "Invalid username/password combination"
  	end

  end


  def login
    
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
    params.require(:user).permit(:email,:password,:kind,:name)
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
