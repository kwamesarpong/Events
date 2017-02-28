require 'pagination.rb'
class ServicesController < ApplicationController

  layout "search_bar" 

  def index
    set_page_number
    count = Service.count
    pagination = Pagination.new(count)
    @total_pages = pagination.total_page_count
    unless @page <= pagination.number_of_records
      @page = 1
    end
    @services = Service.limit(pagination.get_number_of_records_per_page).offset(pagination.offset(@page)).reverse
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
    @service.profile_id = params["profile"]
    @service.picture = params[:service][:picture]
    begin
      @service.save!
      flash[:notice] = @service.id.to_s
      flash[:error] = nil
      redirect_to controller: :profiles, action: :show, id: @service.profile_id
    rescue ActiveRecord::RecordInvalid => invalid
      flash[:error] = invalid.record.errors.full_messages
      flash[:notice] = nil
      redirect_to controller: :profiles, action: :show, id: @service.profile_id
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
    params.require(:service).permit(:category_id,:desc_service,:price,:name_of_service, :metric)
  end
end
