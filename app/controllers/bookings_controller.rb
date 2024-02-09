class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update]
  before_action :set_hotel, only: [:new, :create]

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      params[:booking][:room_ids].each do |room_id|
        @booking.booking_rooms.create(room_id: room_id)
      end
      redirect_to hotel_booking_url(@hotel, @booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @rooms = @hotel.rooms
    @booking = @hotel.bookings.new
  end

  def show
  end

  def update
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:name, :email, :start_date, :end_date, :room_ids)
  end


  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end
end
