require "rails_helper"

RSpec.describe "as a request" do 
  it "retuns to me 
  -the end location
  -the travel time
  -the forecast at the end location
  -a resturant at the location end that is chinese food" do  

  get "/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese"

  clean = JSON.parse(response.body, symbolize_names: true)

  expect(clean[:data]["attributes"]["end_location"]).to eq("Pueblo, CO")
  expect(clean[:data]["attributes"]["travel_time"]).to eq("1 hours 48 min")
  expect(clean[:data]["attributes"]["forecast"]).to eq("some_forecast_results")
  expect(clean[:data]["attributes"]["resturant"]["name"]).to eq("some_chineese_resturant")

  end
end
