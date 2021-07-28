class AddPasswordDigestToNurses < ActiveRecord::Migration[5.2]
  def change
    add_column :nurses, :password_digest, :string
  end
end
