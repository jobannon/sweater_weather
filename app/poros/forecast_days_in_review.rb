class ForecastDaysInReview 
  attr_reader :daily_stats

  def initialize(data)
    @daily_stats = data[:daily][:data].map do |day_block|
      [{time: day_block[:time]}, 
      {time: day_block[:time]}, 
      {icon: day_block[:icon]},
      {humidity: day_block[:humidity]}, 
      {temperatureHigh: day_block[:temperatureHigh]}, 
      {temperatureLow: day_block[:temperatureLow]}] 
    end
  end
end
