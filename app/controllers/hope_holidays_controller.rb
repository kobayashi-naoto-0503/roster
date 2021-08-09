class HopeHolidaysController < ApplicationController
  #before_action :user_logged_in?
  
  def new
    @nurse = Nurse.find_by(id: params[:id])
    @hope_holiday = Hope_holiday.new
  end
  
  def create
    @hope_holiday = Hope_holiday.new(term_params)
    if @hope_holiday.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def nurse_params
    params.require(:hope_holiday).permit(:hope_holiday, :holiday_type, :nurse_id)
  end
  
end
