require 'rails_helper'

RSpec.describe "when the landing page is accessed" do 
  it "can populate the forecast with JSON", :vcr do 
    user = User.create!(email: "jtobannon@gmail.com", password: "password", password_confirmation: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:data][:type]).to eq("forecast")
    expect(results[:data][:attributes][:forecast_summary][:summary][:icon]).to eq("clear-night")
    expect(results[:data][:attributes][:forecast_summary][:summary][:summary]).to eq("Clear")
    expect(results[:data][:attributes][:forecast_summary][:summary][:temperature]).to eq(48.24)
    expect(results[:data][:attributes][:forecast_summary][:summary][:temperature_high]).to eq(62.06)
    expect(results[:data][:attributes][:forecast_summary][:summary][:temperature_low]).to eq(27.76)
    expect(results[:data][:attributes][:forecast_summary][:summary][:state]).to eq("denver")
    expect(results[:data][:attributes][:forecast_summary][:summary][:city]).to eq("co")
    expect(results[:data][:attributes][:forecast_summary][:summary][:time]).to eq(1583291285)
    expect(results[:data][:attributes][:forecast_summary][:summary][:date]).to eq(1583291285)

    expect(results[:data][:attributes][:forecast_details][:details][:icon]).to eq('clear-night')
    expect(results[:data][:attributes][:forecast_details][:details][:summary]).to eq("Clear")
    expect(results[:data][:attributes][:forecast_details][:details][:feel_like]).to eq(48.27)
    expect(results[:data][:attributes][:forecast_details][:details][:humidity]).to eq(26)
    expect(results[:data][:attributes][:forecast_details][:details][:visiblity]).to eq("10.00")
    expect(results[:data][:attributes][:forecast_details][:details][:uv_index]).to eq(0)
    expect(results[:data][:attributes][:forecast_details][:details][:today_message]).to eq("Clear throughout the day.")
    expect(results[:data][:attributes][:forecast_details][:details][:tonight_message]).to eq("Clear")

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

# => {:data=>
#   {:id=>nil,
#    :type=>"forecast",
#    :attributes=>
#     {:forecast_summary=>{:summary=>{:icon=>"clear-night", :summary=>"Clear", :temperature=>48.24, :temperature_high=>62.06, :temperature_low=>27.76, :state=>"denver", :city=>"co", :time=>1583291285, :date=>1583291285}},
#      :forecast_details=>{:details=>{:icon=>"clear-night", :summary=>"Clear", :feel_like=>48.27, :humidity=>26, :visiblity=>"10.00", :uv_index=>0, :today_message=>"Clear throughout the day.", :tonight_message=>"Clear"}},
#      :forecast_days_in_review=>
#       {:daily_stats=>
#         [[{:time=>1583218800}, {:time=>1583218800}, {:icon=>"clear-day"}, {:humidity=>0.32}, {:temperatureHigh=>62.06}, {:temperatureLow=>27.76}],
#          [{:time=>1583305200}, {:time=>1583305200}, {:icon=>"clear-day"}, {:humidity=>0.38}, {:temperatureHigh=>62.34}, {:temperatureLow=>30.37}],
#          [{:time=>1583391600}, {:time=>1583391600}, {:icon=>"clear-day"}, {:humidity=>0.47}, {:temperatureHigh=>59.01}, {:temperatureLow=>31.61}],
#          [{:time=>1583478000}, {:time=>1583478000}, {:icon=>"partly-cloudy-day"}, {:humidity=>0.39}, {:temperatureHigh=>67.92}, {:temperatureLow=>38.61}],
#          [{:time=>1583564400}, {:time=>1583564400}, {:icon=>"partly-cloudy-day"}, {:humidity=>0.31}, {:temperatureHigh=>71.01}, {:temperatureLow=>40.48}],
#          [{:time=>1583650800}, {:time=>1583650800}, {:icon=>"partly-cloudy-day"}, {:humidity=>0.41}, {:temperatureHigh=>65.99}, {:temperatureLow=>35.49}],
#          [{:time=>1583733600}, {:time=>1583733600}, {:icon=>"clear-day"}, {:humidity=>0.47}, {:temperatureHigh=>64.25}, {:temperatureLow=>35.48}],
#          [{:time=>1583820000}, {:time=>1583820000}, {:icon=>"rain"}, {:humidity=>0.6}, {:temperatureHigh=>61.52}, {:temperatureLow=>33.51}]]},
#      :forecast_hours_in_review=>
#       {:hourly_stats=>
#         [[{:time=>1583290800}, {:temperature=>48.64}],
#          [{:time=>1583294400}, {:temperature=>45.62}],
#          [{:time=>1583298000}, {:temperature=>40.68}],
#          [{:time=>1583301600}, {:temperature=>37.02}],
#          [{:time=>1583305200}, {:temperature=>35.59}],
#          [{:time=>1583308800}, {:temperature=>34.08}],
#          [{:time=>1583312400}, {:temperature=>32.65}],
#          [{:time=>1583316000}, {:temperature=>31.42}],
#          [{:time=>1583319600}, {:temperature=>30.05}]]}}}}
