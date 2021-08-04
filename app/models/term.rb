class Term < ApplicationRecord
  belongs_to:nurse
  
  enum employment: { a: 0, b: 1 }
  enum day_shift: { yes: 0, no: 1 }
  enum night_shift: { ok: 0, ng: 1 }
  enum after_night_shift: { y: 0, n: 1 }
  
end
