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
    @flight = Flight.find(booking_params[:flight_id])
    @booking = @flight.bookings.build
    @passenger_params = booking_params[:passengers_attributes]

    @passenger_params.each do |key, value|
      @booking.passengers.build(
        name: @passenger_params[key][:name],
        email: @passenger_params[key][:email])
    end

    respond_to do |format|
      if @booking.save

        @booking.passengers.each do |passenger|
          PassengerMailer.thank_you_email(passenger).deliver_later
        end

        format.html { redirect_to(@booking,
                      :notice => 'Booking was successfully created.') }
        format.json { render :json => @booking,
                      status: :created, location: :post }
      else
        format.html { render action: :new }
        format.json { render :json => @booking.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(
      :flight_id, 
      passengers_attributes: [:name, :email])
  end

end
