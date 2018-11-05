class Api::V1::HotelsController < ApplicationController
  before_action :find_hotel, only: [:update]

  def show
    render json: @hotel
  end


  def create
     @hotel = Hotel.find_or_create_by(hotel_params)
     if @hotel.save
       @token = encode_token(hotel_id: @hotel.id)
       render json: {hotel: HotelSerializer.new(@hotel)}, status: :created
     else
       byebug
       render json: {error: 'Failed to create hotel'}, status: :not_acceptable
     end
  end

  def index
    @hotels = Hotel.all
    render json: @hotels
  end

  def update
    @hotel.update(hotel_params)
    if @hotel.save
      render json: @hotel, status: :accepted
    else
      render json: { errors: @hotel.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @hotel.destroy
    render status: :accepted
  end

  private

  def hotel_params
    params.require(:hotel).permit(:longitude, :latitude, :address, :price, :property_name)
  end

  def find_hotel
    @hotel = Hotel.find(params[:id])
  end
end
