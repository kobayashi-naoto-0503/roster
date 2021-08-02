class CreateHopeHolidays < ActiveRecord::Migration[5.2]
  def change
    create_table :hope_holidays do |t|
      t.integer :nurse_id
      t.datetime :hope_holiday
      t.integer :holiday_type

      t.timestamps
    end
  end
end
