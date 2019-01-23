class ApplicationController < ActionController::Base

  protected
  
  def after_sign_in_path_for(resource)
    orders_path || root_path
  end
end
