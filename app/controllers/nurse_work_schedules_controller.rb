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
    binding.pry
  end
  
end
