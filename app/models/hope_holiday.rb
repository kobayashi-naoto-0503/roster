class HopeHoliday < ApplicationRecord
  
  belongs_to:nurse
  
  enum holiday_type: { a: 0, b: 1, c: 2 }
end
