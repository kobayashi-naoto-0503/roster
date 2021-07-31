class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  
  def current_user
    @current_user ||= Nurse.find_by(id: session[:nurse_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
