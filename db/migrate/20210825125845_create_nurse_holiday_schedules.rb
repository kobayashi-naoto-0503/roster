class CreateNurseHolidaySchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :nurse_holiday_schedules do |t|
      t.integer :nurse_id
      t.datetime :work_day
      t.integer :work_type

      t.timestamps
    end
  end
end
