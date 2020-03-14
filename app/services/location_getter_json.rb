class LocationGetterJson
  attr_reader :location

  def initialize(location, service = 'geocode')
    @service = service 
    @start = location[:start] || location[:origin]
    @end = location[:end] || location[:destination]
    @location = location[:end] || location
  end

  def get_lat
    get_json[:results].first[:geometry][:location][:lat]
 end

  def get_lng
    get_json[:results].first[:geometry][:location][:lng]
  end

  def get_travel_time
    clean_json = get_json_directions()
    clean_json[:routes].first[:legs].first[:duration][:text] #actual human english
  end

  def get_travel_time_seconds
    clean_json = get_json_directions()
    clean_json[:routes].first[:legs].first[:duration][:value] #google value
  end

  private

  def conn(service = 'geocode')
    Faraday.new("https://maps.googleapis.com/maps/api/#{service}/json") do |config|
      config.params['key'] = ENV["GOOGLE_GEOCACHING_API_KEY"]
    end
  end

  def get_json
    response = conn.get do |c|
      c.params['address'] = @location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_json_directions
    response = conn(@service).get do |c|
      c.params['origin'] = @start
      c.params['destination'] = @end
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
