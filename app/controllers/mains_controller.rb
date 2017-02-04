class MainsController < ApplicationController

    layout "main"

    def index
       @categories = Category.all 
    end
end
