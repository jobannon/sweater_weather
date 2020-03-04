class Forecast
  attr_reader :id, :forecast_summary, :forecast_details, :forecast_days_in_review, :forecast_hours_in_review 
   
  def initialize(data, location)
    @id = nil

    @forecast_summary = ForecastSummary.new(data, location)
    @forecast_details = ForecastDetails.new(data, location)
    @forecast_days_in_review = ForecastDaysInReview.new(data)
    @forecast_hours_in_review = ForecastHoursInReview.new(data)
  end
end
