class GoogleLocationMaker
  attr_reader :travel_time, :time_adjust, :lat, :lng 

  def initialize(location_params, argument_for_api_call)
    @location_params = location_params
    @argument_for_api_call = argument_for_api_call

    @lat = get_lat
    @lng = get_lng
    @end_location = location_params[:end]

    @travel_time = get_travel_time_english
    @time_adjust = make_time_adjust
  end

  private 

  def get_lat
    LocationGetterJson.new(@location_params).get_lat
  end

  def get_lng
    LocationGetterJson.new(@location_params).get_lng
  end

  def get_travel_time_english
    LocationGetterJson.new(@location_params, @argument_for_api_call).get_travel_time
  end

  def get_travel_time_seconds
    LocationGetterJson.new(@location_params, @argument_for_api_call).get_travel_time_seconds
  end

  def make_time_adjust
    Time.now.to_i + get_travel_time_seconds
  end
end
