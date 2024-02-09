class HotelsController < ApplicationController
  before_action :set_hotel, only:[:show]

	def index
		@hotels = Hotel.all
		@hotels
	end

	def show
	end

	def new
	   @hotel = Hotel.new
	end

  def create
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      redirect_to @hotel
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def hotel_params
      params.require(:hotel).permit(:name , :address)
    end

    def set_hotel
      @hotel = Hotel.find(params[:id])
    end
end
