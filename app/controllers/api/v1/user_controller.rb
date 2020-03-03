class Api::V1::UserController < ApplicationController
  def create
    @new_user = User.new(user_params)
    if @new_user.save
      render status: :created, json: {api_token: @new_user.api_token}
    else
      errors = @new_user.errors.full_messages.to_sentence
      render status: :not_acceptable, json: {message: errors} 
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
