class CreateLeaves < ActiveRecord::Migration[5.2]
  def change
    create_table :leaves do |t|
      t.integer :nurse_id
      t.integer :leave_type
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
