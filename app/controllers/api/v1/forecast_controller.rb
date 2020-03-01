class Api::V1::ForecastController < ApplicationController
  def show
    lat = LocationGetter.new(location_params).get_lat
    lng = LocationGetter.new(location_params).get_lng
    json_forecast = ForecastGetterJson.new(lat,lng).get_forcast
    
    # parking_space_for_now
    # left_something = ForecastLeftBox.new(json_forecast, location_params[:location])
    # right_something = ForecastRightBox.new(json_forecast, location_params[:location])
    # bottom_something = ForecastBottomBox.new(json_forecast, location_params[:location])

    whole_something = Forecast.new(json_forecast, location_params[:location])

    render json: ForecastSerializer.new(whole_something)
  end

  private

  def location_params
    params.permit(:location)
  end
end

