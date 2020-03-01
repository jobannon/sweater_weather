require 'rails_helper'

RSpec.describe "when the landing page is accessed" do 
  xit "can get a background for the city" do 
    get "api/v1/backgrounds?location=denver,co"

    parsed_data = JSON.parse(response.body, symbolize_names: true) 

    expect(response).to be_sucessful
    expect(parsed_data).to eq()
  end

  xit "can get the lat and long for a city and state" do 
    get '/api/v1/forecast?location=denver,co'
  end

  it "can populate the left text box" do 
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)

    binding.pry
    left_box_results = results[:left_box].to eq("something")
    expect()
  end
end


