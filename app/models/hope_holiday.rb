class HopeHoliday < ApplicationRecord
  
  belongs_to:nurse
  enum authority: { a: 0, b: 1, c: 2 }
end
