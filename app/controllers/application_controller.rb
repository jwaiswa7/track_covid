class ApplicationController < ActionController::Base

  def after_sign_in_path_for(_resource)
    hot_spots_url
  end

end
