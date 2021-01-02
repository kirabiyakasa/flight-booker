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

airport_codes.each do |code|
  Airport.create(code: "#{code}")
end

airports = Airport.all.to_a
destinations = airports.slice(1, airports.length)

destinations.each do |destination|
  destination.arriving_flights.build(from_airport_id: airports[0].id)
  airports.shift
  destination.save
end
