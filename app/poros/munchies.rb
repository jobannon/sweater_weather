class Munchies
  attr_reader :id, :end_location, :travel_time, :forecast, :restaurant

  def initialize(location_params)
    @id = nil
    @location_params = location_params
    @end_location = location_params[:end]

    @google_data_obj = GoogleLocationMaker.new(location_params, 'directions')
    @lat = @google_data_obj.lat
    @lng = @google_data_obj.lng 
    @travel_time = @google_data_obj.travel_time

    @forecast = get_forecast_json[:hourly][:summary]

    yelp_obj = YelpGetter.new(get_yelp_json)

    @restaurant = {name: yelp_obj.name, address: yelp_obj.address}
  end

  private 

  def get_forecast_json
    lat = @google_data_obj.lat
    lng = @google_data_obj.lng
    time_adjust = @google_data_obj.time_adjust
    ForecastGetterJson.new(lat,lng).get_forcast_future(time_adjust)
  end

  def get_yelp_json
    YelpGetterJson.new.get_businesses_with_coordinates(@lat,@lng, @location_params[:food], @google_data_obj.time_adjust)
  end

  def make_yelp_data(yelp_open_business)
    YelpGetter.new(yelp_open_business)
  end

  def make_time_adjust
    Time.now.to_i + get_travel_time_seconds
  end
end
