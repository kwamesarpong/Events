class ReviewsController < ApplicationController

    def new
        @review = Review.new
    end

    def create
        review = Review.new(white_list)
        review.user_id = session["user_id"]
        review.service_id = params["service"].to_i
    end

    private

    def white_list
        params.require(:review).permit(:message)
    end
end
