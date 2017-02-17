class ProfilesController < ApplicationController

  include ApplicationHelper


  #before_action :get_user, only: [:show, :update, :destroy]

  skip_before_action :verify_authenticity_token, only: [ :update, :create ]

  def index
  end

  def show
    init_view(params[:id])
    begin
      profile = Profile.find(params[:id].to_i)
      #check if user is already logged in
      if profile.user_id == session[:user_id]
        redirect_to action: :new, from_there: params[:id]
      end
      @services = Service.where(profile_id: params[:id])
      puts "##########################"
      puts @services
    rescue ActiveRecord::RecordNotFound
      redirect_to '/500.html'
    end
    
    
  end

  def new
    init_view(params[:from_there])
    @my_services = Service.where(profile_id: params[:from_there].to_i)
    begin
      user = @profile.user
      @mail_box = MailBox.find_by_user_id(user.id)
      @mail_box = Message.where(mail_box_id: @mail_box.id).sorted 
      @message = Message.new
      puts "##########################"
      #display_object_attributes @mail_box
      puts @my_services
    rescue ActiveRecord::RecordNotFound
      redirect_to '/404.html'
    end

  end

  def create
    @profile = Profile.new(white_list)
    @profile.profile_picture = params[:profile][:profile_picture]
    #@profile.paid = false
    if (Profile.find_by_user_id(@profile.id))
      @profile.update_attributes(white_list)
      render json :@profile
      elsif @profile.save!
        render json: @profile
      else
        render new
    end
    #display_object_attributes @profile
  end

  def edit
  end

  def update
    @profile = Profile.find_by_id(params[:id])
    #@profile.profile_picture = params[:profile][:profile_picture]
    #update profile
    #@profile.banner = params[:profile][:banner]
    if (@profile.update_attributes(white_list))
      
      #update address here
      address = Address.find_by(profile_id: @profile.id)
      if address.nil?
        address = Address.new
        address.profile_id = @profile.id
        address.physical_address = params[:address][:physical_address]
        address.save
      else
        address.update(physical_address: params[:address][:physical_address])
      end
      
      render json: @profile
    else
      render new
    end
  end

  def delete
  end

  def destroy
  end

  private

  def init_view(param)
    @profile = Profile.find_by_id(param)
    @service = Service.new
    @categories = Category.all
  end

  def white_list
    params.require(:profile).permit(:name_of_agency, :subscription_id, :desc, :user_id, :paid, :short_desc,:tagline, :banner)
  end

  def add_white_list
    params.require(:address).permit(:physical_address)
  end



end
