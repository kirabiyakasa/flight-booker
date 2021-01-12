# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.delete_all
Flight.delete_all

airport_codes = ['SFO', 'NYC', 'ORD', 'PEK', 'LHR', 'CDG', 'DFW', 'CGK', 'FRA',
  'FCO']
start_dates = ['2020-01-02 00:00:00 UTC', '2020-01-04 00:00:00 UTC',
               '2020-01-02 00:00:00 UTC', '2020-01-07 00:00:00 UTC',
               '2020-01-03 00:00:00 UTC', '2020-01-08 00:00:00 UTC',
               '2020-01-04 00:00:00 UTC', '2020-01-08 00:00:00 UTC',
               '2020-01-04 00:00:00 UTC']
durations = ['5:00', '5:30', '6:00', '8:00', '9:00', '10:00', '11:00', '11:30',
  '13:00']

airport_codes.each do |code|
  Airport.create(code: "#{code}")
end

airports = Airport.all.to_a
destinations = airports.slice(1, airports.length)

destinations.each_with_index do |destination, i|
  flight = destination.arriving_flights.build(from_airport_id: airports[0].id)
  flight.start_date = start_dates[i]
  flight.duration = durations[i]
  airports.shift
  destination.save
end
