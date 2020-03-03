require 'rails_helper'

RSpec.describe "as a user, when I request a login" do 
  it "it doesn't log me in when I enter the wrong email" do 
    user = User.create!(email: "jtobannon@gmail.com", password: "password", password_confirmation: "password")
    
    params = {
      email: 'josh@sweater_weather.com',
      password: 'password',
      password_confirmation: 'password'
    }
    post '/api/v1/sessions', params: params 

    clean_json = JSON.parse(response.body, symbolize_names: true)
    expect(clean_json).to eq({message: "Unauthorized - you entered the wrong password or email"})
    expect(response.status).to eq(403)
  end

  it "it logs me in when I enter the proper credentials" do 
    user = User.create!(email: "jtobannon@gmail.com", password: "password", password_confirmation: "password")
    
    params = {
      email: 'jtobannon@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    }
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    post '/api/v1/sessions', params: params 

    clean_json = JSON.parse(response.body, symbolize_names: true)
    expect(clean_json).to eq({api_token: user.api_token})
    expect(response.status).to eq(200)
  end
end
