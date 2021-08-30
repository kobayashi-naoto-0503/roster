class ChangeDatatypeNightShiftOfTerms < ActiveRecord::Migration[5.2]
  def change
    change_column :terms, :night_shift, :boolean
  end
end
