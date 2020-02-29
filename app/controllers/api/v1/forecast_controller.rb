class Api::V1::ForecastController < ApplicationController
  def show
    raw_json = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=Denver,+CO&key=AIzaSyCaX55pPOKJVxy2kH0T9ysvh0exn2UzyE0")
    clean_json = JSON.parse(raw_json.body, symbolize_names:true)
    lng = clean_json[:results].first[:geometry][:location][:lng]
    lat = clean_json[:results].first[:geometry][:location][:lat]
    # JSON.parse(raw_json.body, symbolize_names:true)[:results].first[:geometry][:location][:lat]
    binding.pry
  end
end

