class BookingsController < ApplicationController

    skip_before_action :verify_authenticity_token, only: [:create, :update]

    def create
        booking = Booking.new
        booking.bookee = User.find(params[:booking][:bookee_id].to_i)
        booking.booker = User.find(params[:booking][:booker_id].to_i)
        booking.service = Service.find(params[:booking][:service_id].to_i)
        booking.day_booked = params[:booking][:book_day]
        booking.save
    end

    def update
        booking = Booking.find(params[:id])
        booking.accepted = true
        booking.save
    end


end
