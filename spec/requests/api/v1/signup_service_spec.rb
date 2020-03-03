
require 'rails_helper'

RSpec.describe "as a user, when I request a login" do 
  it "signs me in" do 
    params = {
      email: 'josh@sweater_weather.com',
      password: 'password',
      password_confirmation: 'password'
    }
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    post '/api/v1/users', params: params 

    clean = JSON.parse(response.body, symbolize_names: true)

    expect(clean[:data][:attributes][:return][:status]).to eq("201")

    user_token = User.last.api_token
    expect(clean[:data][:attributes][:return][:body][:api_key]).to eq(user_token)
  end

  it "doesn't save if not provided with everything" do 
    params = {
      email: 'josh@sweater_weather.com',
      password: '',
      password_confirmation: 'password'
    }
    post '/api/v1/users', params: params 

    clean = JSON.parse(response.body, symbolize_names: true)

    expect(clean[:data][:attributes][:return][:status]).to eq("401")
    expect(clean[:data][:attributes][:return][:body][:api_key]).to eq("UNAUTHORIZED - Password can't be blank and Password can't be blank")
  end
end
