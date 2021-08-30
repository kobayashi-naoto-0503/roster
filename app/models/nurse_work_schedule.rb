class NurseWorkSchedule < ApplicationRecord
  
  belongs_to:nurse
  
  enum work_type: { day_shift: 0, night_shift: 1, after_night_shift: 2 }
end
