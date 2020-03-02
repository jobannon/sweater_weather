class LocationGetter
  attr_reader :location

  def initialize(location)
    # @location = location
    @start = location[:start]
    @end = location[:end]
  end

  def get_lat
    get_json[:results].first[:geometry][:location][:lat]
  end

  def get_lng
    get_json[:results].first[:geometry][:location][:lng]
  end

  def get_travel_time
    clean_json = get_json_directions()
    clean_json[:routes].first[:legs].first[:duration][:text]
  end

  private

  def conn
    Faraday.new("https://maps.googleapis.com/maps/api/geocode/json") do |config|
      config.params['key'] = ENV["GOOGLE_GEOCACHING_API_KEY"]
    end
  end

  def conn_for_directions
    Faraday.new("https://maps.googleapis.com/maps/api/directions/json") do |config|
      config.params['key'] = ENV["GOOGLE_GEOCACHING_API_KEY"]
    end
  end
# https://maps.googleapis.com/maps/api/directions/json?origin=Disneyland&destination=Universal+Studios+Hollywood&key=YOUR_API_KEY

  def get_json
    response = conn.get do |c|
      c.params['address'] = @location
    end
    JSON.parse(response.body, symbolize_names:true)
  end

  def get_json_directions
    response = conn_for_directions.get do |c|
      c.params['origin'] = @start
      c.params['destination'] = @end
    end
    JSON.parse(response.body, symbolize_names:true)
  end
  
end
