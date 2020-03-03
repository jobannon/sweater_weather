class ForecastLeftBox < Forecast  
  # belongs_to :forecast

  attr_reader :id, :icon, :summary, :temperature, :temperature_high, :temperature_low, :time, :date, :state, :city, :left

  def initialize(incm_json,location)
    @id =  nil
    @icon = incm_json[:currently][:icon]
    @summary = incm_json[:currently][:summary]
    @temperature = incm_json[:currently][:temperature]
    @temperature_high = incm_json[:daily][:data].first[:temperatureHigh]
    @temperature_low = incm_json[:daily][:data].first[:temperatureLow]
    @state = location.split(',').first
    @city = location.split(',').last
    @time = "need" 
    @date = "need" 

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

    # Time.at().strftime("%B %e, %Y at %I:%M %p")
    # Date.strptime("12/13/2013", "%m/%d/%Y")
    # # [YYYY]-[MM]-[DD]T[HH]:[MM]:[SS][timezone]
  end
end
