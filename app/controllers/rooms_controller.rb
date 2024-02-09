class RoomsController < ApplicationController
  before_action :set_hotel, only: [:new, :create, :index]

  def create
    @room = @hotel.rooms.create(room_params)
    redirect_to hotel_path(@hotel)
  end

  def new
    @room = @hotel.rooms.build
  end

  def index
    @rooms = @hotel.rooms
  end

  private
    def room_params
      params.require(:room).permit(:number)
    end

    def set_hotel
      @hotel = Hotel.find(params[:hotel_id])
    end
end
