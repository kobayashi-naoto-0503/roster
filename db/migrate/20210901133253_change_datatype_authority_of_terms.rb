class ChangeDatatypeAuthorityOfTerms < ActiveRecord::Migration[5.2]
  def change
    change_column :nurses, :authority, :boolean
  end
end
