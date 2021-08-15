class Term < ApplicationRecord
  validates :employment, presence: true
  validates :day_shift, presence: true
  validates :night_shift, presence: true
  validates :after_night_shift, presence: true
  validates :nurse_id, presence: true
  
  enum employment: { a: 0, b: 1 }
  enum day_shift: { c: 0, d: 1 }
  enum night_shift: { ok: 0, ng: 1 }
  enum after_night_shift: { y: 0, n: 1 }
  
  belongs_to:nurse
  
end
