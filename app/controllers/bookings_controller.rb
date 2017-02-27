class BookingsController < ApplicationController

    skip_before_action :verify_authenticity_token, only: [:create]

    def create
        booking = Booking.new
        booking.user = User.find(params[:booking][:user_id])
        booking.service = Service.find(params[:booking][:service_id])
        booking.day_booked = params[:booking][:book_day]
        booking.save     
    end


end
