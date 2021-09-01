class ChangeColumnDefaultToTerms < ActiveRecord::Migration[5.2]
  def change
    change_column_null :terms, :day_shift, false, 0
    change_column_null :terms, :night_shift, false, 0
    change_column_null :terms, :after_night_shift, false, 0
    change_column_default :terms, :day_shift, from: nil, to: 0
    change_column_default :terms, :night_shift, from: nil, to: 0
    change_column_default :terms, :after_night_shift, from: nil, to: 0
  end
end
