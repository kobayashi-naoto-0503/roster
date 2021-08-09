class Nurse < ApplicationRecord
  validates :affiliation, presence: true
  validates :staff_id, presence: true
  validates :name, presence: true,length:{maximum:15}
  validates :authority, presence: true
  validates :password,format:{with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/}
  
  enum affiliation: { a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7, i: 8, j: 9 }
  enum authority: { k: 0, l: 1 }
  
  has_secure_password
  
  has_many:hope_holiday
  has_one:term
end
