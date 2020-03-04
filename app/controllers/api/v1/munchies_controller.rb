class Api::V1::MunchiesController < ApplicationController
  def show
    if current_user
      render json: MunchiesSerializer.new(Munchies.new(location_params))
    else
      render json: { error_message: "Not Authorized" }
    end
  end

  private

  def location_params
    params.permit(:start, :end, :food)
  end
end
