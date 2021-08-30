class Leave < ApplicationRecord
  
  enum leave_type: { maternity_leave: 0, childcare_leave: 1 }
  
  belongs_to:nurse
end
