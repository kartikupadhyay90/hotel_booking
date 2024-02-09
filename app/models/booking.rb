class Booking < ApplicationRecord
  has_many :booking_rooms
  has_many :room, through: :booking_rooms
end
