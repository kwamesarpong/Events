class ProfilesController < ApplicationController

  include ApplicationHelper


  #before_action :get_user, only: [:show, :update, :destroy]

  skip_before_action :verify_authenticity_token, only: [ :update, :create ]

  def index
  end

  def show
    @profile = Profile.find(params[:id])
    @service = Service.new
    @categories = Category.all
  end

  def new
    @profile = Profile.find(params[:from_there])
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
    if (@profile.update_attributes(white_list))
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

  def white_list
    params.require(:profile).permit(:name_of_agency, :subscription_id, :desc, :user_id, :paid, :short_desc,:tagline)
  end

end
