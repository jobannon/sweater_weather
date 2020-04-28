
class BaseController < ApplicationController
  before_action :require_user

  def require_current_user
    render '/errors/404' unless current_user && current_user.merchant?
  end
end
