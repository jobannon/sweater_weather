class ForecastLeftBox 
  attr_reader :id, :icon, :summary, :temperature, :temperature_high, :temperature_low, :time, :date, :state, :city

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
    # Time.at().strftime("%B %e, %Y at %I:%M %p")
    # Date.strptime("12/13/2013", "%m/%d/%Y")
    # # [YYYY]-[MM]-[DD]T[HH]:[MM]:[SS][timezone]
  end
end
