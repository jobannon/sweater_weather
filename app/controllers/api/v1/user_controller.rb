class Api::V1::UserController < ApplicationController
  def create
    @new_user = User.new(user_params)
    if @new_user.save
      allow_access = true
      render json: UserAccessSerializer.new(UserAccess.new(@new_user.api_token, allow_access))
      render status: :created, json: UserAccessSerializer.new(UserAccess.new(@new_user.api_token, allow_access))
    else
      allow_access = false
      errors = @new_user.errors.full_messages.to_sentence
      render status: :error, json: UserAccessSerializer.new(UserAccess.new(@new_user.api_token, allow_access, errors))
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
