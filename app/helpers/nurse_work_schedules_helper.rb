module NurseWorkSchedulesHelper
  
  def display_of_day_of_the_week_new_view(day)
    days = ["日", "月", "火", "水", "木", "金", "土"]
    return days[Date.new(Date.current.next_month.year, Date.current.next_month.month, day).wday]
  end
  
  def display_of_day_of_the_week_show_view(day)
    days = ["日", "月", "火", "水", "木", "金", "土"]
    return days[Date.new(params[:year_date][:year].to_i, params[:month_date][:month].to_i, day+1).wday]
  end
  
  def nurse_select(nurse)
    Term.find_by(nurse_id: nurse.id)
  end
  
  
  def select_condition(nurse)
    term = Term.find_by(nurse_id: nurse.id)
    hash = {}
    hash["日"] = 0 if term.day_shift
    hash["夜"] = 1 if term.night_shift
    hash["明"] = 2 if term.after_night_shift
    hash["公"] = 3
    hash["有"] = 4
    hash["リ"] = 5
    return hash
  end
  
  def select_holiday(nurse,t)
      3 if hope_holiday.holiday_type == "public_holiday"
      4 if hope_holiday.holiday_type == "paid_holiday"
      5 if hope_holiday.holiday_type == "refresh_vacation"
  end
  
  def work_type_view(nurse)
    nurse_work_schedules = NurseWorkSchedule.where(nurse_id: nurse.id)
    work_type_array = []
    nurse_work_schedules.each do |nurse_work_schedule|
      if nurse_work_schedule.work_day.year == params[:year_date][:year].to_i && nurse_work_schedule.work_day.month == params[:month_date][:month].to_i
        work_type_array << "日" if nurse_work_schedule.work_type == "day_shift"
        work_type_array << "夜" if nurse_work_schedule.work_type == "night_shift"
        work_type_array << "明" if nurse_work_schedule.work_type == "after_night_shift"
        work_type_array << "公" if nurse_work_schedule.work_type == "public_holiday"
        work_type_array << "有" if nurse_work_schedule.work_type == "paid_holiday"
        work_type_array << "リ" if nurse_work_schedule.work_type == "refresh_vacation"
      end
    end
    return work_type_array
  end
  
  #def work_schedule_index
  #  nurse_work_schedules = NurseWorkSchedule.where(nurse_id:current_user.id)
  #  work_schedule_index_hash = {}
  #  nurse_work_schedules.each do |nurse_work_schedule|
  #    work_schedule_index_hash[nurse_work_schedule.work_day.strftime("%Y年%m月")] = nurse_work_schedule.work_day.strftime("%Y-%m")
  #  end
  #  return work_schedule_index_hash
  #end
end