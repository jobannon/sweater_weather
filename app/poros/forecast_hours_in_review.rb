class ForecastHoursInReview 
  attr_reader :hourly_stats 

  def initialize(data)
    @hourly_stats = build_hourly_details(data)
  end
  
  def build_hourly_details(data)
    total_hours_to_display = 8

    data[:hourly][:data][0..total_hours_to_display].map do |hour_block|
      [{time: hour_block[:time]},
      {temperature: hour_block[:temperature]}]
    end
  end
end
