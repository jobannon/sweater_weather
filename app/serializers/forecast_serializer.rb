class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :icon, :summary, :temperature, :temperature_high, :temperature_low, :city, :state, :time, :date
end
