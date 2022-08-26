class ApplicationController < ActionController::Base
  def after_sign_in_path(resource)
    stored_location_for(resource) || welcome_path
  end
end
