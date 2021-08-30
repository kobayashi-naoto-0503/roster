class ChangeDatatypeAfterNightShiftOfTerms < ActiveRecord::Migration[5.2]
  def change
    change_column :terms, :after_night_shift, :boolean
  end
end
