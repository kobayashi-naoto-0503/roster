class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  before_action :user_logged_in?
  
  def current_user
    @current_user ||= Nurse.find_by(id: session[:nurse_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
  def user_logged_in? #認証情報の有無で、ログインしているかしていないかを分岐させる関数。
    if session[:nurse_id] #認証情報。「もし、session_contollerにlog_inメソッドで、session[:user_id]にログイン情報を保存しているなら。」
      begin #通常処理。begin~rescue~endはエラーが起きた時（今回はログイン情報がなかったら）実行が停止しないようにするメソッド
        @current_user = Nurse.find_by(id: session[:nurse_id]) #session[:user_id]を@current_userに格納
      rescue ActiveRecord::RecordNotFound #エラー発生時の処理。ActiveRecord::RecordNotFoundが起こって止めない為の処理
        reset_user_session #セッション情報を消去している。
      end
    end
    return if @current_user #@current_userにログイン情報を保存していなければ、リダイレクトする。
      flash[:referer] = request.fullpath #リクエストurlを取得
      redirect_to root_path 
  end
  
  def reset_user_session #リセットしたらsession[:user_id]と@current_userを空にする。
    session[:nurse_id] = nil
    @current_user = nil
  end
  
  def forbid_login_user 
    if session[:nurse_id] 
      flash[:notice]="ログイン中です"
      redirect_to  new_nurse_work_schedule_path 
    end
  end
  

end
