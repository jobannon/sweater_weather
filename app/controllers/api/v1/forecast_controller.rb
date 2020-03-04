class Api::V1::ForecastController < ApplicationController
  def show
    if current_user
      lat = LocationGetterJson.new(location_params).get_lat
      lng = LocationGetterJson.new(location_params).get_lng
      json_forecast = ForecastGetterJson.new(lat,lng).get_forcast

      whole_something = Forecast.new(json_forecast, location_params[:location])

      render json: ForecastSerializer.new(whole_something)
    else
      render json: { error_message: "Not Authorized" }
    end
  end

  private

  def location_params
    params.permit(:location)
  end
end

