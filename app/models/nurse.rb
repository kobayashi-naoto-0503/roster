class Nurse < ApplicationRecord
  validates :department_id, presence: true
  validates :staff_id, presence: true
  validates :name, presence: true,length:{maximum:15}
  validates :password,format:{with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/}
  
  has_secure_password
  
  belongs_to:department
  has_many:hope_holiday
  has_one:term
  has_many:leave
  has_many:nurse_work_schedule
end
