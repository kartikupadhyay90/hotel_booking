class Room < ApplicationRecord
	belongs_to :hotel
	has_many :booking_rooms
	has_many :bookings, through: :booking_rooms

	validates :number, presence: true
end
