class UsersController < ApplicationController

  include ApplicationHelper

  layout :set_layout
  
  before_action :get_user, only: [:show, :update, :destroy]


  def index
  end

  def show
  end

  def new
    if session[:user_id]
      profile = Profile.find_by_user_id(session[:user_id])
      redirect_to controller: :profiles, action: :show, id: profile.id
    else
      @categories = Category.all
      @user = User.new
      render :new
    end

  end

  def create
    @user = User.new(white_list)
    if @user.save
      session[:user_id] = @user.id
      #USER CREATED
      #puts display_object_attributes @user
      
        #USER IS SERVICE PROVIDER
        profile = Profile.new
        profile.user_id = @user.id
        profile.name_of_agency = "Name Of Agency"
        #make sure subcriptions are created beforehand
        profile.subscription_id = 1
        profile.desc = "A short description here"
        profile.paid = false
        profile.save

        mail_box = MailBox.new
        mail_box.user = @user
        mail_box.save
        if @user.kind == User::SERVICE_PROVIDER
          redirect_to controller: :profiles, action: :new, from_there: profile.id
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
      if found_user.kind == User::SERVICE_PROVIDER
        #send user to profile
        redirect_to controller: :profiles, action: :new, from_there: found_user.profile.id
      else
        redirect_to '/'
      end
  	else
  		flash[:notice] = "Invalid username/password combination"
  	end

  end


  def login
    
  end

  def edit
  end

  def update
    #if !params[:sign_up].nil?
      @user = User.find(params[:id].to_i)
      puts @user.password_digest
      @user.password = params[:user][:password]
      @user.kind = params[:user][:kind]
      puts @user.password
      @user.save
      display_object_attributes @user
      redirect_to controller: :profiles, action: :new, from_there: @user.profile.id
    #end
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
