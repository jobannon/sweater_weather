class Api::V1::RoadTripController < ApplicationController
  def show
    # this_current_user = User.find_by(api_token: location_params[:api_token])
    # if this_current_user.nil?
    #   render status: :unauthorized, json: {message: "Please enter a valid API key"}
    # else
      render status: :ok, json: RoadTripSerializer.new(RoadTrip.new(location_params))
    # end
  end

  def location_params 
    params.permit(:origin, :destination, :api_token)
  end
end 
