class CategoriesController < ApplicationController

    layout "search_bar"

    def index
        @categories = Category.all
    end

    def show
        @services = Service.where("category_id = ?", params[:id].to_i)
    end
    
end
