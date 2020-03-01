class ForecastGetterJson
  attr_reader :lat, :lng

  def initialize(lat,lng)
    @lat = lat
    @lng = lng
  end

  def get_forcast
    get_json
  end

  private

  def conn
    Faraday.new("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{@lat},#{@lng}") 
  end

  def get_json
    response = conn.get do |c|
    end
    JSON.parse(response.body, symbolize_names:true)
  end
end
