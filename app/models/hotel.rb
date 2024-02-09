class Hotel < ApplicationRecord
	has_many :rooms
	has_many :bookings
	validates :name, :address, presence: true
end
