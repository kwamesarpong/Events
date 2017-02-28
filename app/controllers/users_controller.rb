class UsersController < ApplicationController

  include ApplicationHelper

  layout :set_layout
  
  #before_action :get_user, only: [:show, :update]

  def new
    begin
      if !session[:evventor_user].nil?
        profile = Profile.find_by_user_id(session[:evventor_user].to_i)
        redirect_to controller: :profiles, action: :show, id: profile.id
      else
        @categories = Category.all
        @user = User.new
        render :new
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to '/404.html'
    end
    

  end

  def create
    @user = User.new(white_list)
    if @user.save
      session[:evventor_user] = @user.id
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
          redirect_to controller: :mains, action: :index
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
  		session[:evventor_user] = authorized_user.id
  		flash[:notice] = "You are now logged in"
      if found_user.kind == User::SERVICE_PROVIDER
        #send user to profile
        redirect_to controller: :profiles, action: :show, id: found_user.profile.id
      else
        redirect_to '/'
      end
  	else
  		flash[:notice] = "Invalid username/password combination"
  	end

  end


  def sign_out
    session[:evventor_user] = nil
  	#session[:username] = nil
  	flash[:notice] = "You are now logged out"
  	redirect_to controller: :users, action: :new
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


  def login
    @user = User.new
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
