class Leave < ApplicationRecord
  
  enum leave_type: { a: 0, b: 1 }
  
  belongs_to:nurse
end
