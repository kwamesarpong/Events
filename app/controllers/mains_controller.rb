class MainsController < ApplicationController

    layout "main"

    def index
       @categories = Category.all 
    end


    def search
        results = PgSearch.multisearch(params[:q])
        puts results
    end

    
end
