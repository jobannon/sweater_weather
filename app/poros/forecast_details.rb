class ForecastDetails
  attr_reader :details

  def initialize(data, location) 
    @details = build_details_hash(data)
  end

  def build_details_hash(data)
    {
     icon: data[:currently][:icon],
     summary: data[:currently][:summary],
     feel_like: data[:currently][:apparentTemperature],
     humidity: (data[:currently][:humidity] * 100).round(0),
     visiblity: sprintf( "%0.02f", data[:currently][:visibility]),
     uv_index: data[:currently][:uvIndex],
     today_message: data[:daily][:data].first[:summary],
     tonight_message: data[:hourly][:data].last[:summary]
    }
  end
end
