class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      login_redirect(user)
    else
      flash[:notice] = 'Your email or password was incorrect!'
      render :new
    end
  end
end
