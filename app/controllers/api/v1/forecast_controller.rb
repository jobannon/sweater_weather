class Api::V1::ForecastController < ApplicationController
  def show
    lat = LocationGetter.new(location_params).get_lat
    lng = LocationGetter.new(location_params).get_lng

    raw_json_forecast = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{lat},#{lng}")
    binding.pry
  end

  private

  def location_params
    params.permit(:location)
  end
end

