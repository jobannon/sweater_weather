class Munchies
  attr_reader :id, :end_location, :travel_time, :forecast, :restaurant

  def initialize(location_params)
    @id = nil
    @location_params = location_params
    @lat = get_lat
    @lng = get_lng
    @end_location = location_params[:end]

    @travel_time = get_travel_time_english
    @time_adjust = make_time_adjust

    @forecast = get_forecast_json[:hourly][:summary]

    yelp_obj = YelpGetter.new(get_yelp_json)

    @restaurant = {name: yelp_obj.name, address: yelp_obj.address}
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

  def get_forecast_json
    ForecastGetterJson.new(@lat,@lng).get_forcast_future(@time_adjust)
  end

  def get_yelp_json
    YelpGetterJson.new.get_businesses_with_coordinates(@lat,@lng, @location_params[:food], @time_adjust)
  end

  def make_yelp_data(yelp_open_business)
    YelpGetter.new(yelp_open_business)
  end

  def make_time_adjust
    Time.now.to_i + get_travel_time_seconds
  end
end
