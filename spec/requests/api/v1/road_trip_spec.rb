require "rails_helper"

RSpec.describe "when I ask for a road trip" do 
  it "shows me
      -the travel time 
      -between a start and end (also displayed) 
      -and the forecast temp" do

    user = User.create!(email: "jtobannon@gmail.com", password: "password", password_confirmation: "password")
    params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_token": user.api_token
    }
    allow(Time).to receive(:now).and_return(Time.parse('2020-03-02 11:22:54 -0700'))
    post '/api/v1/road_trip', params: params

    clean = JSON.parse(response.body, symbolize_names: true)

    expect(clean[:data][:attributes].count).to eq(6)

    expect(clean[:data][:attributes][:end_location]).to eq("Pueblo,CO")
    expect(clean[:data][:attributes][:travel_time]).to eq("1 hour 48 mins")
    expect(clean[:data][:attributes][:forecast]).to eq("Clear throughout the day.")
    expect(clean[:data][:attributes][:arrival_temperature]).to eq(28.61)
  end

  it "endpoint doesn't return if not valid api key" do 
    params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_token": "empty" 
    }
    post '/api/v1/road_trip', params: params

    clean = JSON.parse(response.body, symbolize_names: true)

    expect(clean[:message]).to eq("Please enter a valid API key")


  end
end
