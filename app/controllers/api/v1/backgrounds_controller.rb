class Api::V1::BackgroundsController < ApplicationController

  def show
    background_img = BackgroundGetter.new(location_params)#.get_photo_url
    render json: BackgroundGetterSerializer.new(background_img)
  end

  def location_params
    params.permit(:location)
  end
end

