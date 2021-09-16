class NurseWorkSchedulesController < ApplicationController
  
  def index
    
  end
  
  def new
    @nurse_work_schedules = NurseWorkSchedule.new
    @nurse_holiday_schedules = NurseHolidaySchedule.new
    @day = Date.current.next_month.end_of_month.day.to_i #現在から見て1ヶ月後の日時の最終日を数値型で取得
    @nurses = Nurse.all
    
    #binding.pry
  end
  
  def create
    nurses = Nurse.all
    nurse_params_array =[]
    nurses.each do |nurse|
      nurse_params = params["nurse_#{nurse.id}"]
      nurse_params.each{|key,value| nurse_params_array << value}
    end
    @nurse_work_schedule = NurseWorkSchedule.new(nurse_params_array)
    if @nurse_work_schedule.save
      
      redirect_to nurse_path(@nurse.id), success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
end
