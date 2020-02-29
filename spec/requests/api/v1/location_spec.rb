require 'rails_helper'

RSpec.describe "when the landing page is accessed" do 
  xit "can get a background for the city" do 
    get "api/v1/backgrounds?location=denver,co"

    parsed_data = JSON.parse(response.body, symbolize_names: true) 

    expect(parsed_data).to eq()
  end

  it "can get the lat and long for a city and state" do 
    get '/api/v1/forecast?location=denver,co'

     
  end
end


