class NurseHolidaySchedule < ApplicationRecord
  
  belongs_to:nurse
  
  enum work_type: { public_holiday: 0, paid_holiday: 1, refresh_vacation: 2 }
end
