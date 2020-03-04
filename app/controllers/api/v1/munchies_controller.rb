class Api::V1::MunchiesController < ApplicationController
  def show
    render json: MunchiesSerializer.new(Munchies.new(location_params))
  end

  private

  def location_params
    params.permit(:start, :end, :food)
  end
end
