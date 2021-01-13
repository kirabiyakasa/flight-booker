class Booking < ApplicationRecord
  has_many :passengers, foreign_key: :booking_id
  belongs_to :flight
end