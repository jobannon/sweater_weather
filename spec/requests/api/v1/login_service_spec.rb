require 'rails_helper'

RSpec.describe "as a user, when I request a login" do 
  it "logs me in" do 
    user = User.create!(email: "jtobannon@gmail.com", password_digest: "password")
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    post 'api/v1/sessions', { email: 'josh@sweater_weather.com', password: 'password' } 
  end
end
