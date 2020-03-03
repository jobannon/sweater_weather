class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    binding.pry
    if user && user.authenticate(params[:password])
      render json: user.api_token
      # login_redirect(user)
    else
      render status: 500, status: :forbidden, json: "Some error code - you entered the wrong password or email"
      # flash[:notice] = 'Your email or password was incorrect!'
      # render :new
    end
  end
end
