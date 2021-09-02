module ApplicationHelper
  def current_user
    @current_user ||= Nurse.find_by(id: session[:nurse_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
  def yes_no_select_option
    [["否",0],["可",1]]
  end
end
