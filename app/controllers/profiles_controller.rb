class ProfilesController < ApplicationController

  include ApplicationHelper


  #before_action :get_user, only: [:show, :update, :destroy]

  skip_before_action :verify_authenticity_token, only: [ :update, :create ]

  def index
  end

  def show
    init_view(params[:id])
    @my_services = Service.find(profile_id: params[:id])
    puts "##########################"
    puts @my_services
    render :new
  end

  def new
    init_view(params[:from_there])
    @my_services = Service.where(profile_id: params[:from_there])
    puts "##########################"
    puts @my_services
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
    @profile.profile_picture = params[:profile][:profile_picture]
    #update profile
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
    params.require(:profile).permit(:name_of_agency, :subscription_id, :desc, :user_id, :paid, :short_desc,:tagline)
  end

  def add_white_list
    params.require(:address).permit(:physical_address)
  end



end
