require "rails_helper"

RSpec.describe "as a request" do 
  it "returns to me 
    -the end location
    -the travel time
    -the forecast at the end location
    -a restaurant at the location end that is chinese food", :vcr do  

  user = User.create!(email: "jtobannon@gmail.com", password: "password", password_confirmation: "password")
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  allow(Time).to receive(:now).and_return(Time.parse('2020-03-02 11:22:54 -0700'))

  get "/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese"

  clean = JSON.parse(response.body, symbolize_names: true)

  expect(clean[:data][:attributes].count).to eq(5)

  expect(clean[:data][:attributes][:end_location]).to eq("pueblo,co")
  expect(clean[:data][:attributes][:travel_time]).to eq("1 hour 48 mins")
  expect(clean[:data][:attributes][:forecast]).to eq("Flurries in the morning.")
  expect(clean[:data][:attributes][:restaurant][:name]).to eq("Kan's Kitchen")
  expect(clean[:data][:attributes][:restaurant][:address]).to eq("1620 S Prairie Ave")
  end
end
