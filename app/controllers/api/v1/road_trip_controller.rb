class Api::V1::RoadTripController < ApplicationController
  def show
    find_user = User.find_by(road_trip_params[:api_key])
    render json: RoadTripSerializer.new(RoadTrip.new)
  end

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end 
