class ForecastLeftBoxSerializer
  include FastJsonapi::ObjectSerializer
  # attributes :id, :icon, :summary, :temperature, :temperature_high, :temperature_low, :city, :state, :time, :date
  attributes :id, :city, :state
end
