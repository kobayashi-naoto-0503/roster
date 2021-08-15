class HopeHolidaysController < ApplicationController
  #before_action :user_logged_in?
  
  def new
    @nurse = Nurse.find_by(id: params[:id])
    @hope_holiday = HopeHoliday.new
    #HopeHoliday.newをスネークケース（Hope_holiday）にしていたら、ロードエラーを起こした。app/models/hope_holiday.rb内のclassm名が
    #アッパーキャメルケースであったからか？
  end
  
  def create
    @hope_holiday = HopeHoliday.new(hope_holiday_params)
    if @hope_holiday.save
      redirect_to nurse_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def hope_holiday_params
    params.require(:hope_holiday).permit(:hope_holiday, :holiday_type, :nurse_id)
  end
  
end
