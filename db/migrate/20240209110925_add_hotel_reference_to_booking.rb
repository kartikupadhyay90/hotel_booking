class AddHotelReferenceToBooking < ActiveRecord::Migration[7.1]
  def change
  	add_reference :bookings, :hotel, index: true
  end
end
