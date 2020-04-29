class RoadTrip
  attr_reader :id, :start_location, :end_location, :travel_time, :forecast, :arrival_temperature, :restaurant

  def initialize(location_params)
    @id = nil
    @location_params = location_params
    @lat = get_lat
    @lng = get_lng
    @end_location = location_params[:destination]
    @start_location = location_params[:origin]

    @travel_time = get_travel_time_english
    @time_adjust = make_time_adjust

    @forecast = get_forecast_json_future[:hourly][:summary]
    @arrival_temperature = get_forecast_json_future[:hourly][:data].first[:temperature]
  end

  private 

  def get_lat
    LocationGetterJson.new(@location_params).get_lat
  end

  def get_lng
    LocationGetterJson.new(@location_params).get_lng
  end

  def get_travel_time_english
    LocationGetterJson.new(@location_params, 'directions').get_travel_time
  end

  def get_travel_time_seconds
    LocationGetterJson.new(@location_params, 'directions').get_travel_time_seconds
  end

  def get_forecast_json_future
    ForecastGetterJson.new(@lat,@lng).get_forcast_future(@time_adjust)
  end

  def make_time_adjust
    Time.now.to_i + get_travel_time_seconds
  end
end
