class ForecastGetterJson
  attr_reader :lat, :lng, :time

  def initialize(lat,lng)
    @lat = lat
    @lng = lng
  end

  def get_forcast
    get_json
  end

  def get_forcast_future(time)
    @time = time
    get_json_with_time
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

  def conn_with_time
    Faraday.new("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{@lat},#{@lng},#{@time}") 
  end

  def get_json_with_time
    response = conn.get do |c|
    end
    JSON.parse(response.body, symbolize_names:true)
  end
end
