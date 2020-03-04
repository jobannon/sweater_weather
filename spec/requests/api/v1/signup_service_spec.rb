
require 'rails_helper'

RSpec.describe "as a user, when I request a login" do 
  it "signs me in", :vcr do 
    params = {
      email: 'josh@sweater_weather.com',
      password: 'password',
      password_confirmation: 'password'
    }
    post '/api/v1/users', params: params 

    clean = JSON.parse(response.body, symbolize_names: true)

    user_token = User.last.api_token

    expect(clean).to eq({api_token: user_token})
    expect(response.status).to eq(201)
  end

  it "doesn't save if not provided with everything", :vcr do 
    params = {
      email: 'josh@sweater_weather.com',
      password: '',
      password_confirmation: 'password'
    }
    post '/api/v1/users', params: params 

    clean = JSON.parse(response.body, symbolize_names: true)

    expect(clean).to eq({message: "Password can't be blank and Password can't be blank"})
    expect(response.status).to eq(406) 
  end
end
