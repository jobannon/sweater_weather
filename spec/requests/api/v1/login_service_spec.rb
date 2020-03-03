require 'rails_helper'

RSpec.describe "as a user, when I request a login" do 
  it "it doesn't log me in when I enter the wrong email" do 
    user = User.create!(email: "jtobannon@gmail.com", password: "password", password_confirmation: "password")
    
    params = {
      email: 'josh@sweater_weather.com',
      password: 'password',
      password_confirmation: 'password'
    }
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    post '/api/v1/sessions', params: params 

    binding.pry
    clean = JSON.parse(response.body, symbolize_names: true)
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
    binding.pry

    clean = JSON.parse(response.body, symbolize_names: true)
  end
end
require "rails_helper"

# RSpec.describe "Authenticating with the API" do
#   before do
#     Rails.application.routes.draw do
#       get "/api/test" => "test#index"
#     end
#   end

#   after do
#     Rails.application.reload_routes!
#   end

#   context "when the user provides a valid api token" do
#     it "allows the user to pass" do
#       create(:user, token: "sekkrit")
#       credentials = authenticate_with_token("sekkrit")

#       get "/api/test", headers: { "Authorization" => credentials }

#       expect(response).to be_successful
#       expect(response.body).to eq({ "message" => "Hello world!" }.to_json)
#     end
#   end

#   context "when the user provides an invalid api token" do
#     it "does not allow to user to pass" do
#       create(:user, token: "sekkrit")
#       credentials = authenticate_with_token("less-sekkrit")

#       get "/api/test", headers: { "Authorization" => credentials }

#       expect(response).to be_unauthorized
#     end
#   end

#   private

#   TestController = Class.new(Api::BaseController) do
#     def index
#       render json: { message: "Hello world!" }
#     end
#   end

#   def authenticate_with_token(token)
#     ActionController::HttpAuthentication::Token.encode_credentials(token)
#   end
# end
