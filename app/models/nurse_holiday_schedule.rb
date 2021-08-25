class NurseHolidaySchedule < ApplicationRecord
  
  belongs_to:nurse
  
  enum work_type: { a: 0, b: 1, c: 2 }
end
