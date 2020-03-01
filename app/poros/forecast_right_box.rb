class ForecastRightBox

  def initialize(incm_json,location)
    @icon = incm_json[:currently][:icon]
    @summary = incm_json[:currently][:summary]
    @feel_like = incm_json[:currently][:apparentTemperature] 
    @humidity = (incm_json[:currently][:humidity] * 100).round(0)
    @visiblity = sprintf( "%0.02f", incm_json[:currently][:visibility])
    @uv_index = incm_json[:currently][:uvIndex]
    @today_message =  incm_json[:daily][:data].first[:summary]
    @tommorrow_message = incm_json[:daily][:data].second[:summary]
  end
end  
