class Term < ApplicationRecord
  validates :employment, presence: true
  validates :day_shift, presence: true
  validates :night_shift, presence: true
  validates :after_night_shift, presence: true
  validates :nurse_id, presence: true
  
  enum employment: { full_time: 0, part_time: 1 }
  
  belongs_to:nurse
  
end
