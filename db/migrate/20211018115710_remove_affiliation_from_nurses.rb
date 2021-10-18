class RemoveAffiliationFromNurses < ActiveRecord::Migration[5.2]
  def change
    remove_column :nurses, :affiliation, :integer
  end
end
