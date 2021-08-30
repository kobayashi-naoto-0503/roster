class Term < ApplicationRecord
  validates :employment, presence: true
  validates :day_shift, presence: true
  validates :night_shift, presence: true
  validates :after_night_shift, presence: true
  validates :nurse_id, presence: true
  
  enum employment: { full_time: 0, part_time: 1 }
  enum day_shift: { possible: true, impossible: false }
  enum night_shift: { possible2: true, impossible2: false }
  enum after_night_shift: { possible3: true, impossible3: false }
  validates :day_shift, inclusion: {in: ["possible", "impossible"]}
  validates :night_shift, inclusion: {in: ["possible2", "impossible2"]}
  validates :after_night_shift, inclusion: {in: ["possible3", "impossible3"]}
  
  belongs_to:nurse
  
end
