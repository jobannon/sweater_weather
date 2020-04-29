class Api::V1::BackgroundsController < ApplicationController

  def show
    # if current_user
      background_img = BackgroundGetter.new(location_params)#.get_photo_url
      render json: BackgroundGetterSerializer.new(background_img)
    # else
      # render json: { error_message: "Not Authorized" }
    # end
  end

  def location_params
    params.permit(:location)
  end
end

