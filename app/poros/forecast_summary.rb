class ForecastSummary
  attr_reader :icon, :summary, :temperature, :temperature_high, :temperature_low, :state, :city, :time, :date 

  def initialize(data, location)
    build_forcast(data, location)
  end 

  def build_forcast(data, location) 
      @icon = data[:currently][:icon]
      @summary = data[:currently][:summary]
      @temperature = data[:currently][:temperature]
      @temperature_high = data[:daily][:data].first[:temperatureHigh]
      @temperature_low = data[:daily][:data].first[:temperatureLow]
      @state = location.split(',').first
      @city = location.split(',').last
      @time = data[:currently][:time]
      @date = data[:currently][:time]
  end
end

