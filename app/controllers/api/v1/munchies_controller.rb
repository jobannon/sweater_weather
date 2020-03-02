class Api::V1::MunchiesController < ApplicationController
  def show
    lat = LocationGetter.new(location_params).get_lat
    lng = LocationGetter.new(location_params).get_lng

    travel_time_english = LocationGetter.new(location_params).get_travel_time
    travel_time_seconds = LocationGetter.new(location_params).get_travel_time_seconds
    
    time_adjust = Time.now.to_i + travel_time_seconds
    json_forecast = ForecastGetterJson.new(lat,lng).get_forcast_future(time_adjust)

    yelp_open_business = YelpGetterJson.new.get_businesses_with_coordinates(lat,lng, location_params[:food], time_adjust) 
    yelp_obj = YelpGetter.new(yelp_open_business)

    final_results_hash_builder = FinalResults.new(location_params, travel_time_english, json_forecast, yelp_obj)

    binding.pry
  end

  private

  def location_params
    params.permit(:start, :end, :food)
  end
end
