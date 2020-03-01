class ForecastBottomBox
  def initialize(incm_json,location)
    i = 1
    @days_array = Array.new && make_days_array(incm_json)
    @days_array_temp = Array.new && make_days_array_temp(incm_json)
  end


  def make_days_array(incm_json)
    i = 1
    @days_array = []
    incm_json[:daily][:data].reduce({}) do |acc, day_block|
      i = i + 1
      acc[("day_"+"#{i}").to_sym] = [day_block[:time], day_block[:icon], day_block[:humidity], day_block[:temperatureHigh], day_block[:temperatureLow]]  
      acc
    end
  end

  def make_days_array_temp(incm_json)
    i=1
    incm_json[:daily][:data].reduce({}) do |acc, day_block|
      i = i + 1
      acc[("day_"+"#{i}").to_sym] = [day_block[:time], day_block[:temperatureHigh]]
      acc
    end
  end
end

