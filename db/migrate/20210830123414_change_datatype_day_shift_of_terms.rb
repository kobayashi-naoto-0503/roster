class ChangeDatatypeDayShiftOfTerms < ActiveRecord::Migration[5.2]
  def change
    change_column :terms, :day_shift, :boolean
  end
end
