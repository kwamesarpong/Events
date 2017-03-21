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
      @services = Service.where(profile_id: params[:id]).last(2).reverse
      user = @profile.user
      @bookings = Booking.where(bookee_id: user.id)
      @mail_box = MailBox.find_by_user_id(user.id)
      @mail_box = Message.where(mail_box_id: @mail_box.id).sorted 
      @message = Message.new
    rescue ActiveRecord::RecordNotFound
      redirect_to '/500.html'
    end
    
    
  end

  def new
    if session[:evventor_user].nil?
      redirect_to controller: :users, action: :new
    end
    init_view(params[:from_there])
  end

  def create
    @profile = Profile.new(white_list)
    @profile.profile_picture = params[:profile][:profile_picture]
    @profile.paid = false
    @profile.subscription = Subscription::FREE
    if (Profile.find_by_user_id(@profile.id))
      @profile.update_attributes(white_list)
      render json: @profile
      elsif @profile.save!
        render json: @profile
      else
        render new
    end
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
    begin
      @profile = Profile.find_by_id(param)
      @service = Service.new
      @categories = Category.all
    rescue ActiveRecord::RecordNotFound
      redirect_to '/404.html'
    end

  end

  def white_list
    params.require(:profile).permit(:name_of_agency, :subscription_id, :desc, :user_id, :paid, :short_desc,:tagline, :banner)
  end

  def add_white_list
    params.require(:address).permit(:physical_address)
  end



end
