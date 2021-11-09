class NurseWorkSchedulesController < ApplicationController
  SHIFT_TYPE = [DAY_SHIFT,NIGHT_SHIFT,AFTER_NIGHT_SHIFT,PUBLIC_HOLIDAY,PAID_HOLIDAY,REFRESH_VACATION,MATERNITY_LEAVE,CHILDCARE_LEAVE]
  HOLIDAY_SHIFT_TYPE = [PUBLIC_HOLIDAY,PAID_HOLIDAY,REFRESH_VACATION]
  
  def index
    @nurses = Nurse.all
    @nurse_work_schedules = NurseWorkSchedule.all
  end
  
  def show
    @month = params[:month_date][:month]
    @day = Date.new(params[:year_date][:year].to_i, params[:month_date][:month].to_i).end_of_month.day
    @nurses = Nurse.all
    @nurse_work_schedules = NurseWorkSchedule.all
  end
  
  def new
    @nurse_work_schedules = NurseWorkSchedule.new
    @nurse_holiday_schedules = NurseHolidaySchedule.new
    @day = Date.current.next_month.end_of_month.day.to_i #現在から見て1ヶ月後の日時の最終日を数値型で取得
    @nurses = Nurse.all
    @hope_holidays = HopeHoliday.all
    @leaves = Leave.all
  end
  
  def edit
    @nurse_work_schedule = NurseWorkSchedule.find(params[:id])
  end
  
  def update
    @nurse_work_schedule = NurseWorkSchedule.find(params[:id].to_i) #編集したデータを受け取っている。
    @nurse_work_schedule.work_day.year
    @nurse_work_schedule.update(work_type_params) 
    redirect_to  nurse_work_schedule_path(year_date: {year: @nurse_work_schedule.work_day.year},month_date: {month: @nurse_work_schedule.work_day.month})
    #pathでviewに送るidをコントローラーで取得し、渡す。
  end
  
  def create
    nurses = Nurse.all
    nurse_work_schedules =[]
    nurses.each do |nurse|
      if current_user.department_id == nurse.department_id
      nurse_params = params["nurse_#{nurse.id}"]
      nurse_params.each do |key,value| 
        value["work_type"] = value["work_type"].to_i
        value.permit!
        nurse_work_schedules << NurseWorkSchedule.new(value.to_h)
      end
      end
    end
    NurseWorkSchedule.import nurse_work_schedules
    flash[:notice] = "登録が完了しました。"
  end
  
   private
  def work_type_params
    params.require(:nurse_work_schedule).permit(:work_type)
  end
  
end
