class ServicesController < ApplicationController
  
  #include ApplicationHelper

  NUMBER_OF_RECORDS_PER_PAGE = 2

  layout "search_bar"

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

    begin
      @service = Service.find(params[:id])
      @message = Message.new
    rescue ActiveRecord::RecordNotFound
      redirect_to '/404.html'
    end
    
  end

  def new
    
  end

  def create
    @service = Service.new(white_list)
    #@service.name_of_service = "Music"
    @service.profile_id = params["profile"]
    @service.picture = params[:service][:picture]
    if @service.save!
        flash[:notice] = @service.id.to_s
        redirect_to controller: :profiles, action: :new, from_there: @service.profile_id
      else
        flash[:notice] = nil
        render controller: :profiles, action: :new
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
    params.require(:service).permit(:category_id,:desc_service,:price,:name_of_service)
  end
end
