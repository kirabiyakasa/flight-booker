class FlightsController < ApplicationController

  def index
    @flight = Flight.new
    @flights = Flight.all

    respond_to do |format|
      if params[:flight]
        format.html { redirect_to flight_url(params[:flight][:id],
          passengers: params[:passengers]) }
      else
        format.html
        format.js
      end
    end
  end

  def show
  end

  def search
    @flight = Flight.new
    #@search_params = request.query_parameters
    #@search_params[:start_date] = convert_date(@search_params[:start_date])
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

  def search_params
    params.require(:flight).permit(:start_date, :duration, :from_airport_id,
      :to_airport_id)
  end

end