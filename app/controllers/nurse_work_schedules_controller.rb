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
    i = 1
    params["work_type_#{i}"]
    @nurse_work_schedule = NurseWorkSchedule.new(params)
    #if @term.save
    #   redirect_to nurse_path(@nurse.id), success: '登録が完了しました'
    # else
    #  flash.now[:danger] = "登録に失敗しました"
    #  render :new
    #end
    binding.pry
  end
  
  private
  #def nurse_work_schedule_params(i)
  #  params.require("work_type_#{i}").permit(:work_type, :datetime, :nurse_id)
  #end
end
