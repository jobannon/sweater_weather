class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :start_location, :end_location, :travel_time, :forecast, :arrival_temperature
end
