class SessionsController < ApplicationController
  before_action :forbid_login_user, {only: [:new]}
  skip_before_action :user_logged_in?
  
  def new
  end
  
  def create
    nurse = Nurse.find_by(staff_id: params[:session][:staff_id])
    if nurse && nurse.authenticate(params[:session][:password])
      log_in nurse
      redirect_to nurse_work_schedules_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  private
  def log_in(nurse)
    session[:nurse_id] = nurse.id
  end
  
  def log_out
    session.delete(:nurse_id)
    @current_user = nil
  end
end
