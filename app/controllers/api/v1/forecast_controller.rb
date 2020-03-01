class Api::V1::ForecastController < ApplicationController
  def show
    lat = LocationGetter.new(location_params).get_lat
    lng = LocationGetter.new(location_params).get_lng

    json_forecast = ForecastGetterJson.new(lat,lng).get_forcast
    left_something = ForecastLeftBox.new(json_forecast, location_params[:location])
    right_something = ForecastRightBox.new(json_forecast, location_params[:location])
    bottom_something = ForecastBottomBox.new(json_forecast, location_params[:location])
    binding.pry
    # options = {}
    # options[:include] = [:ForecastLeftBox]
    render json: ForecastSerializer.new(left_something)

    # render json: ForecastSerializer.new([left_something, right_something, bottom_something])
  end

  private

  def location_params
    params.permit(:location)
  end
end

