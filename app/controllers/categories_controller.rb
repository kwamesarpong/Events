require 'pagination.rb'
class CategoriesController < ApplicationController

    layout "search_bar"

    def index
        redirect_to '/404.html'
    end

    def show
        set_page_number
        count = Service.where("category_id = ?", params[:id].to_i).count
        pagination = Pagination.new(count)
        @total_pages = pagination.total_page_count
        unless @page <= pagination.number_of_records
            @page = 1
        end
        @services = Service.get_category_listings(params[:id].to_i).limit(pagination.get_number_of_records_per_page).offset(pagination.offset(@page)).reverse
    end
    
end
