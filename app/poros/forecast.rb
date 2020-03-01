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
    @left[:id] = nil
    @left[:icon] = incm_json[:currently][:icon]
    @left[:summary]= incm_json[:currently][:summary]
    @left[:temperature] = incm_json[:currently][:temperature]
    @left[:temperature_high] = incm_json[:daily][:data].first[:temperatureHigh]
    @left[:temperature_low] = incm_json[:daily][:data].first[:temperatureLow]
    @left[:state] = location.split(',').first
    @left[:city] = location.split(',').last
    @left[:time] = "need" 
    @left[:date] = "need" 
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
    @right[:tommorrow_message] = incm_json[:daily][:data].second[:summary]
  end

  def make_bottom(incm_json, location)
    i = 1
    @bottom = {}
    @bottom[:across_days] =@days_array = Array.new && bottom_make_days_array(incm_json)
    @bottom[:temp_days] = @days_array_temp = Array.new && bottom_make_days_array_temp(incm_json)
  end

  private 

  def bottom_make_days_array(incm_json)
    i = 1
    @days_array = []
    incm_json[:daily][:data].reduce({}) do |acc, day_block|
      i = i + 1
      acc[("day_"+"#{i}").to_sym] = [day_block[:time], day_block[:icon], day_block[:humidity], day_block[:temperatureHigh], day_block[:temperatureLow]]  
      acc
    end
  end

  def bottom_make_days_array_temp(incm_json)
    i=1
    incm_json[:daily][:data].reduce({}) do |acc, day_block|
      i = i + 1
      acc[("day_"+"#{i}").to_sym] = [day_block[:time], day_block[:temperatureHigh]]
      acc
    end
  end
end
