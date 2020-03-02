require "rails_helper"

RSpec.describe "as a request" do 
  it "retuns to me 
  -the end location
  -the travel time
  -the forecast at the end location
  -a restaurant at the location end that is chinese food" do  

  get "/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese"

  clean = JSON.parse(response.body, symbolize_names: true)
  binding.pry

  expect(clean[:data][:attributes][:end_location]).to eq("pueblo,co")
  expect(clean[:data][:attributes][:travel_time]).to eq("1 hour 48 mins")
  expect(clean[:data][:attributes][:forecast]).to eq("Clear throughout the day.")
  expect(clean[:data][:attributes][:restaurant][:name]).to eq("Kan's Kitchen")
  expect(clean[:data][:attributes][:restaurant][:address]).to eq("1620 S Prairie Ave")

  end
end
