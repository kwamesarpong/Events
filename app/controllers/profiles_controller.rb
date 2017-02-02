class ProfilesController < ApplicationController

  include ApplicationHelper

  #before_action :get_user, only: [:show, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @profile = Profile.new
    @subscriptions = Subscription.all
    session["user"] = get_hidden_user
  end

  def create
    @profile = Profile.new(white_list)
    @profile.user_id = session["user"]["id"]
    @profile.profile_picture = params[:profile][:profile_picture]
    @profile.paid = false
    if @profile.save!
      redirect_to action: :index 
    else
      render :new
    end
    #display_object_attributes @profile
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
    params.require(:profile).permit(:name_of_agency,:subscription_id,:desc)
  end

end
