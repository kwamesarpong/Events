class MainsController < ApplicationController

    layout :set_layout

    skip_before_action :verify_authenticity_token, only: :async_search

    
    def index
       @categories = Category.all
       #check to see if user is signed in.
       if !session[:user_id].nil?
           begin
             user = User.find(session[:user_id])
             @profile = user.profile
           rescue ActiveRecord::RecordNotFound
             redirect_to '404.html'
           end
           
       end
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
