class LoginsController < ApplicationController
  def new
  end
  
  def index
  end
  
  def create
    nurse = Nurse.find_by(affiliation: params[:login][:affiliation])
    if (nurse && nurse.authenticate(params[:login][:staff_id])) && nurse.authenticate(params[:login][:password])
      log_in nurse
      redirect_to root_path, success: 'ログインに成功しました'
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
  def log_in(user)
    login[:nurse_id] = nurse.id
  end
  
  def log_out
    login.delete(:nurse_id)
    @current_user = nil
  end
end
