class ServicesController < ApplicationController
  
  #include ApplicationHelper

  NUMBER_OF_RECORDS_PER_PAGE = 2

  layout "search"

  def index
    @page = params[:page].to_i
    count = Service.count
    #pagination
    @total_pages = count / NUMBER_OF_RECORDS_PER_PAGE
    unless @page <= Service.count
      @page = 1
    end
    offset = ( @page - 1 ) * NUMBER_OF_RECORDS_PER_PAGE
    @services = Service.limit(NUMBER_OF_RECORDS_PER_PAGE).offset(offset)
  end

  def show
    #@service = Service.find(params[:id])
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
