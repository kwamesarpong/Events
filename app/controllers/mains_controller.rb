class MainsController < ApplicationController

    layout :set_layout
    
    def index
       @categories = Category.all 
    end


    def search
        search = PgSearch.multisearch(params[:q])
        @items = search.map(&:searchable)
    end

    def set_layout
        case action_name
        when "index"
            "application"
        else
            "search_bar"
        end
    end

    
end
