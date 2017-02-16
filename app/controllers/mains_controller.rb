class MainsController < ApplicationController

    layout :set_layout

    skip_before_action :verify_authenticity_token, only: :async_search

    
    def index
       @categories = Category.all 
    end


    def search
        search = PgSearch.multisearch(params[:q])
        @items = search.map(&:searchable)
    end

    
    def async_search
        results = PgSearch.multisearch(params[:search][:q])
        @items = results.map(&:searchable)
        render json:@items
    end


    private

    def set_layout
        case action_name
        when "index"
            "application"
        else
            "search_bar"
        end
    end

    
end
