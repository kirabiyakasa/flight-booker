class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    @passengers = []

    unless params[:passengers].empty?
      params[:passengers].to_i.times do
        @passengers << @booking.passengers.build
      end
    end
  end

  def create
  end

end
