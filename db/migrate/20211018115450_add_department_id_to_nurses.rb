class AddDepartmentIdToNurses < ActiveRecord::Migration[5.2]
  def change
    add_column :nurses, :department_id, :integer
  end
end
