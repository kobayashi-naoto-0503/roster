class TermsController < ApplicationController
  #before_action :user_logged_in?
  
  def new
    @nurse = Nurse.find_by(params[:nurse_id])
    @term = Term.new
  end
  
  def create
    @term = Term.new(term_params)
    if @term.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def nurse_params
    params.require(:term).permit(:employment, :day_shift, :night_shift, :after_night_shift, :nurse_id)
  end
end
