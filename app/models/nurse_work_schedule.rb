class NurseWorkSchedule < ApplicationRecord
  
  belongs_to:nurse
  
  enum work_type: { day_shift: 0, night_shift: 1, after_night_shift: 2, public_holiday: 3, paid_holiday: 4, refresh_vacation: 5 }
end
