class Api::V1::MunchiesController < ApplicationController
  def show
    lat = LocationGetter.new(location_params).get_lat
    lng = LocationGetter.new(location_params).get_lng

    travel_time = LocationGetter.new(location_params).get_travel_time
    forcast = ForecastGetterJson.new()
    final_results_hash_builder = FinalResults.new(travel_time)
    binding.pry
  end

  private

  def location_params
    params.permit(:start, :end, :food)
  end
end
