require 'rails_helper'

RSpec.describe "when the landing page is accessed" do 
  it "can populate the forecast with JSON", :vcr do 
    user = User.create!(email: "jtobannon@gmail.com", password: "password", password_confirmation: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)

    binding.pry
    expect(results[:data][:type]).to eq("forecast")
    expect(results[:data][:attributes][:forecast_summary][:icon]).to eq("clear-day")
    expect(results[:data][:attributes][:forecast_summary][:summary]).to eq("Clear")
    expect(results[:data][:attributes][:forecast_summary][:temperature]).to eq(48.24)
    expect(results[:data][:attributes][:forecast_summary][:temperature_high]).to eq(62.06)
    expect(results[:data][:attributes][:forecast_summary][:temperature_low]).to eq(27.76)
    expect(results[:data][:attributes][:forecast_summary][:state]).to eq("denver")
    expect(results[:data][:attributes][:forecast_summary][:city]).to eq("co")
    expect(results[:data][:attributes][:forecast_summary][:time]).to eq(1583291285)
    expect(results[:data][:attributes][:forecast_summary][:date]).to eq(1583291285)

    expect(results[:data][:attributes][:forecast_details][:icon]).to eq('clear-night')
    expect(results[:data][:attributes][:forecast_details][:summary]).to eq("Clear")
    expect(results[:data][:attributes][:forecast_details][:feel_like]).to eq(48.27)
    expect(results[:data][:attributes][:forecast_details][:humidity]).to eq(26)
    expect(results[:data][:attributes][:forecast_details][:visiblity]).to eq("10.00")
    expect(results[:data][:attributes][:forecast_details][:uv_index]).to eq(0)
    expect(results[:data][:attributes][:forecast_details][:today_message]).to eq("Clear throughout the day.")
    expect(results[:data][:attributes][:forecast_details][:tonight_message]).to eq("Clear")

    expect(results[:data][:attributes][:forecast_days_in_review][:daily_stats].count).to eq(8)
    expect(results[:data][:attributes][:forecast_days_in_review][:daily_stats].first.first[:time]).to eq(1583218800)
    expect(results[:data][:attributes][:forecast_days_in_review][:daily_stats].first[1][:icon]).to eq("clear-day")
    expect(results[:data][:attributes][:forecast_days_in_review][:daily_stats].first[2][:humidity]).to eq(0.32)
    expect(results[:data][:attributes][:forecast_days_in_review][:daily_stats].first[3][:temperatureHigh]).to eq(62.06)
    expect(results[:data][:attributes][:forecast_days_in_review][:daily_stats].first[4][:temperatureLow]).to eq(27.76)

    expect(results[:data][:attributes][:forecast_hours_in_review][:hourly_stats].count).to eq(9)
    expect(results[:data][:attributes][:forecast_hours_in_review][:hourly_stats].first.first[:time]).to eq(1583290800)
    expect(results[:data][:attributes][:forecast_hours_in_review][:hourly_stats].first.second[:temperature]).to eq(48.64)
  end
end
