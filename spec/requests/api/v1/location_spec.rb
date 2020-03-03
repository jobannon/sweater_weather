require 'rails_helper'

RSpec.describe "when the landing page is accessed" do 
  it "can populate the forecast with JSON" do 
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:data][:attributes][:left].keys.count).to eq(9)
    expect(results[:data][:attributes][:right].keys.count).to eq(8)
    expect(results[:data][:attributes][:bottom].keys.count).to eq(2)
    expect(results[:data][:attributes][:bottom][:across_days].keys.count).to eq(8)
    expect(results[:data][:attributes][:bottom][:across_days][:"day+1"].keys.count).to eq(5)
    expect(results[:data][:attributes][:bottom][:temp_hours].keys.count).to eq(8)
    expect(results[:data][:attributes][:bottom][:temp_hours][:"hour+1"].keys.count).to eq(2)
  end
end


