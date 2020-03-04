class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  # attributes :icon, :summary, :temperature, :temperature_high, :temperature_low, :city, :state, :time, :date
  attributes :forecast_summary, :forecast_details, :forecast_days_in_review, :forecast_hours_in_review 

end
