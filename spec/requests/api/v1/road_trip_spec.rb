require "rails_helper"

RSpec.describe "when I ask for a road trip" do 
  it "shows me the travel time between a start and end (also displayed) and the forecast temp" do
    user = User.create!(email: "jtobannon@gmail.com", password: "password", password_confirmation: "password")
    params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": user.api_token
    }
    post '/api/v1/road_trip', params: params
  end
end

