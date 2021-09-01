class ChangeColumnDefaultToNurses < ActiveRecord::Migration[5.2]
  def change
    change_column_null :nurses, :authority, false, 0
    change_column_default :nurses, :authority, from: nil, to: 0
  end
end
