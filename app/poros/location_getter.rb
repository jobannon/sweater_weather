class LocationGetter
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def get_lat
    get_json[:results].first[:geometry][:location][:lat]
  end

  def get_lng
    get_json[:results].first[:geometry][:location][:lng]
  end

  private

  def conn
    Faraday.new("https://maps.googleapis.com/maps/api/geocode/json") do |config|
      config.params['key'] = ENV["GOOGLE_GEOCACHING_API_KEY"]
    end
  end

  def get_json
    response = conn.get do |c|
      c.params['address'] = @location
    end
    JSON.parse(response.body, symbolize_names:true)
  end
  
end
