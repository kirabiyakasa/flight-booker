class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport, class_name: 'Airport'


  def self.search_flights(search_params)
    flight = Flight.where(
    'start_date = ? AND from_airport_id = ? AND to_airport_id = ?',
    search_params[:start_date], search_params[:from_airport_id],
    search_params[:to_airport_id])

    return flight
  end
end
