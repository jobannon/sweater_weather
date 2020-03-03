class Forecast
  attr_reader :id, :left, :right, :bottom
   
  def initialize(incm_json, location)
    @id = nil

    make_left(incm_json, location)
    make_right(incm_json, location)
    make_bottom(incm_json, location)
  end

  def make_left(incm_json, location)
    @left = {}
    @left[:icon] = incm_json[:currently][:icon]
    @left[:summary]= incm_json[:currently][:summary]
    @left[:temperature] = incm_json[:currently][:temperature]
    @left[:temperature_high] = incm_json[:daily][:data].first[:temperatureHigh]
    @left[:temperature_low] = incm_json[:daily][:data].first[:temperatureLow]
    @left[:state] = location.split(',').first
    @left[:city] = location.split(',').last
    @left[:time] = incm_json[:currently][:time]
    @left[:date] = incm_json[:currently][:time]
  end

  def make_right(incm_json, location)
    @right = {}
    @right[:icon] = incm_json[:currently][:icon]
    @right[:summary] = incm_json[:currently][:summary]
    @right[:feel_like] = incm_json[:currently][:apparentTemperature] 
    @right[:humidity] = (incm_json[:currently][:humidity] * 100).round(0)
    @right[:visiblity] = sprintf( "%0.02f", incm_json[:currently][:visibility])
    @right[:uv_index] = incm_json[:currently][:uvIndex]
    @right[:today_message] =  incm_json[:daily][:data].first[:summary]
    @right[:tonight_message] =incm_json[:hourly][:data].last[:summary]
  end

  def make_bottom(incm_json, location)
    i = 0 
    @bottom = {}

    @days_hash = bottom_make_days_hash(incm_json)
    @bottom[:across_days] = @days_hash

    @hours_hash_temp = bottom_make_hours_hash_temp(incm_json)
    @bottom[:temp_hours] = @hours_hash_temp 
  end

  private 

  def bottom_make_days_hash(incm_json)
    i = 0 

    incm_json[:daily][:data].reduce({}) do |acc, day_block|
     i = i + 1

     some_hash = {
                   time: day_block[:time], 
                   time: day_block[:time], 
                   icon: day_block[:icon],
                   humidity: day_block[:humidity], 
                   temperatureHigh: day_block[:temperatureHigh], 
                   temperatureLow: day_block[:temperatureLow] 
                 }

      acc[("day+"+"#{i}").to_sym] = some_hash
      acc
    end
  end

  def bottom_make_hours_hash_temp(incm_json)
    i= 0

    incm_json[:hourly][:data].reduce({}) do |acc, hour_block|
      i = i + 1

      if i < 9 
        some_hash = {
        time: hour_block[:time],
        temperature: hour_block[:temperature]
        }
        acc[("hour+"+"#{i}").to_sym] = some_hash 
      end

      acc
    end
  end
end
