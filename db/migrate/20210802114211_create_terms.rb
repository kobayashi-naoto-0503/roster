class CreateTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :terms do |t|
      t.integer :nurse_id
      t.integer :employment
      t.integer :day_shift
      t.integer :night_shift
      t.integer :after_night_shift

      t.timestamps
    end
  end
end
