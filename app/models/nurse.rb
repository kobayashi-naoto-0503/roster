class Nurse < ApplicationRecord
  validates :affiliation, presence: true
  validates :staff_id, presence: true
  validates :name, presence: true,length:{maximum:15}
  validates :authority, presence: true
  validates :password,format:{with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/}
  
  has_secure_password
end
