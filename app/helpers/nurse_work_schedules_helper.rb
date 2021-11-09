module NurseWorkSchedulesHelper
  
  def display_of_day_of_the_week_new_view(day) #nurse_work_scheduleのnew.htmlでの曜日の表示。
    days = ["日", "月", "火", "水", "木", "金", "土"]
    return days[Date.new(Date.current.next_month.year, Date.current.next_month.month, day).wday]
  end
  
  def display_of_day_of_the_week_show_view(day) #nurse_work_scheduleのshow.htmlでの曜日の表示。
    days = ["日", "月", "火", "水", "木", "金", "土"]
    return days[Date.new(params[:year_date][:year].to_i, params[:month_date][:month].to_i, day+1).wday]
  end
  
  def leave_date_condition(t) #nurse_work_scheduleのnew.htmlにある40行目のif文で使っている。
    Date.new(Date.current.next_month.year,Date.current.next_month.month,t+1).strftime("%Y年%m月%d日")
  end
  
  def nurse_employment(nurse) #nurse_work_scheduleのnew.htmlにある28行目
    term = Term.find_by(nurse_id: nurse.id)
    term.employment_i18n if term.present?
  end
  
  def select_leave(leave) #nurse_work_scheduleのnew.htmlにある41行目の選択指定で使っている。
    select_leave_hash = {}
    select_leave_hash["産"] = MATERNITY_LEAVE if leave.present? && leave.leave_type == "maternity_leave"
    select_leave_hash["育"] = CHILDCARE_LEAVE if leave.present? && leave.leave_type == "childcare_leave"
    return select_leave_hash
  end
  
  def select_holiday(hope_holiday) #nurse_work_scheduleのnew.htmlにある41行目の選択指定で使っている。
    select_holiday_hash = {}
    select_holiday_hash["公"] = PUBLIC_HOLIDAY if hope_holiday.present? && hope_holiday.holiday_type == "public_holiday"
    select_holiday_hash["有"] = PAID_HOLIDAY if hope_holiday.present? && hope_holiday.holiday_type == "paid_holiday"
    select_holiday_hash["リ"] = REFRESH_VACATION if hope_holiday.present? && hope_holiday.holiday_type == "refresh_vacation"
    return select_holiday_hash
  end
  
  def select_condition(nurse) #options_for_selectで使っている。
    term = Term.find_by(nurse_id: nurse.id)
    hash = {}
    hash["日"] = DAY_SHIFT if term.present? && term.day_shift
    hash["夜"] = NIGHT_SHIFT if term.present? && term.night_shift
    hash["明"] = AFTER_NIGHT_SHIFT if term.present? && term.after_night_shift
    hash["公"] = PUBLIC_HOLIDAY
    hash["有"] = PAID_HOLIDAY
    hash["リ"] = REFRESH_VACATION
    return hash
  end
  
  def work_type_view(nurse) #nurse_work_scheduleのshow.htmlにある40行目
    nurse_work_schedules = NurseWorkSchedule.where(nurse_id: nurse.id)
    work_type_array = []
    nurse_work_schedules.each do |nurse_work_schedule|
      if nurse_work_schedule.present? && nurse_work_schedule.work_day.year == params[:year_date][:year].to_i && nurse_work_schedule.work_day.month == params[:month_date][:month].to_i  
        work_type_array << "日" if nurse_work_schedule.work_type == "day_shift"
        work_type_array << "夜" if nurse_work_schedule.work_type == "night_shift"
        work_type_array << "明" if nurse_work_schedule.work_type == "after_night_shift"
        work_type_array << "公" if nurse_work_schedule.work_type == "public_holiday"
        work_type_array << "有" if nurse_work_schedule.work_type == "paid_holiday"
        work_type_array << "リ" if nurse_work_schedule.work_type == "refresh_vacation"
        work_type_array << "産" if nurse_work_schedule.work_type == "maternity_leave"
        work_type_array << "育" if nurse_work_schedule.work_type == "childcare_leave"
      end
    end
    return work_type_array
  end

end