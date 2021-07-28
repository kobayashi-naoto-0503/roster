class CreateNurses < ActiveRecord::Migration[5.2]
  def change
    create_table :nurses do |t|
      t.integer :affiliation
      t.integer :staff_id
      t.string :name
      t.integer :authority

      t.timestamps
    end
  end
end
