class ServicesController < ApplicationController
  
  include ApplicationHelper

  def index
    @services = Service.all
  end

  def show
    @services = Service.where(category_id: params[:id])
  end

  def new
    
  end

  def create
    @service = Service.new(white_list)
    @service.profile_id = params["profile"]
    @service.picture = params[:service][:picture]
    if @service.save!
        redirect_to controller: :profiles, action: :show, id: @service.profile_id
      else
        puts "not here"
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
    params.require(:service).permit(:category_id,:desc_service,:price)
  end
end
