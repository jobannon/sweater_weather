class Api::V1::UserController < ApplicationController
  def create
    find_user = User.find_by(email: user_params[:email])
    if !(find_user.nil?) 
      render status: :found, json: {api_token: find_user.api_token}
    else
      @new_user = User.new(user_params)
      if @new_user.save
        render status: :created, json: {api_token: @new_user.api_token}
      else
        errors = @new_user.errors.full_messages.to_sentence
        render status: :not_acceptable, json: {message: errors} 
      end
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
