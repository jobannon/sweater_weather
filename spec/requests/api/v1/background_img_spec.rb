require "rails_helper"

RSpec.describe "when I visit the forecast page " do 
  it "pulls a background image to me to see based on the city searched for", :vcr do 
    get '/api/v1/backgrounds?location=denver,co'

    # results = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
 
    url = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:url]
    expected_img = "https://images.unsplash.com/photo-1470240731273-7821a6eeb6bd?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjExODM0NX0"
    expect(url).to eq(expected_img)
  end
end
