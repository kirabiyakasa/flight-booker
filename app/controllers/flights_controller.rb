class FlightsController < ApplicationController

  def index
    @flight = Flight.new
    @flights = Flight.all

    respond_to do |format|
      if params[:flight]
        format.html { redirect_to new_booking_url(
          flight_id: params[:flight][:id],
          passengers: params[:passengers]) }
      else
        format.html
        format.js
      end
    end
  end

  def search
    @flight = Flight.new

    params[:start_date] = convert_date(params[:start_date])
    @search_results = Flight.search_flights(params)
  end

  private

  def convert_date(date)
    date = date.split("/")
    date[-1] = '20' + date[-1]
    date = date.reverse.join("-")
    return date
  end

end
