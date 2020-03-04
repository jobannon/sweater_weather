# class FinalResults
#   attr_reader :id, :end_location, :travel_time, :forecast, :restaurant

#   def initialize(location, travel_time, json_forecast, yelp_obj)
#     @end_location = location[:end]
#     @travel_time = travel_time

#     @forecast = json_forecast[:hourly][:summary]

#     @restaurant = {name: yelp_obj.name, address: yelp_obj.address}
#   end
# end
