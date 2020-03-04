class ForecastSummary
  attr_reader :summary
  def initialize(data, location)
    @summary = {}
    @summary[:icon] = data[:currently][:icon]
    @summary[:summary]= data[:currently][:summary]
    @summary[:temperature] = data[:currently][:temperature]
    @summary[:temperature_high] = data[:daily][:data].first[:temperatureHigh]
    @summary[:temperature_low] = data[:daily][:data].first[:temperatureLow]
    @summary[:state] = location.split(',').first
    @summary[:city] = location.split(',').last
    @summary[:time] = data[:currently][:time]
    @summary[:date] = data[:currently][:time]
  end
end
