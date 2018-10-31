class Api::V1::TripsController < ApplicationController
  before_action :find_trip, only: [:update]
  def index
    @trips = Trip.all
    render json: @trips
  end

  def update
    @trip.update(trip_params)
    if @trip.save
      render json: @trip, status: :accepted
    else
      render json: { errors: @trip.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def trip_params
    params.permit(:name, :user_id, :location, :start_date, :end_date, :num_ppl, :price, :longitude, :latitude)
  end

  def find_trip
    @trip = Trip.find(params[:id])
  end
end
