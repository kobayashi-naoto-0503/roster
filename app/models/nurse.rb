class Nurse < ApplicationRecord
  validates :affiliation, presence: true
  validates :staff_id, presence: true
  validates :name, presence: true,length:{maximum:15}
  validates :password,format:{with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/}
  
  enum affiliation: { system_department: 0, nursing_manager: 1, ward_2a: 2, ward_2b: 3, ward_3a: 4, ward_3b: 5, ward_4a: 6, ward_5a: 7, temporary_ward_1: 8, temporary_ward_2: 9 }
  
  has_secure_password
  
  has_many:hope_holiday
  has_one:term
  has_many:leave
  has_many:nurse_work_schedule
end
