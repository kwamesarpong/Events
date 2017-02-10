class MainsController < ApplicationController

    layout "main"

    NUMBER_OF_RECORDS_PER_PAGE = 2
    
    def index
       @categories = Category.all 
    end


    def search
        search = PgSearch.multisearch(params[:q])
        @items = search.map(&:searchable)
    end

    
end
