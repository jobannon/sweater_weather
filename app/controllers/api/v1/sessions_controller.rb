class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render status: :ok, json: {api_token: user.api_token}
    else
      render status: :forbidden, json: {message: "Unauthorized - you entered the wrong password or email"}
    end
  end
end
