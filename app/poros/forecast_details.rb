class ForecastDetails
  attr_reader :icon, :summary, :feel_like, :humidity, :visiblity, :uv_index, :today_message, :tonight_message

  def initialize(data, location) 
    build_details(data)
  end

  def build_details(data)
     @icon = data[:currently][:icon],
     @summary = data[:currently][:summary],
     @feel_like = data[:currently][:apparentTemperature],
     @humidity = (data[:currently][:humidity] * 100).round(0),
     @visiblity = sprintf( "%0.02f", data[:currently][:visibility]),
     @uv_index = data[:currently][:uvIndex],
     @today_message = data[:daily][:data].first[:summary],
     @tonight_message =  data[:hourly][:data].last[:summary]
  end

end
