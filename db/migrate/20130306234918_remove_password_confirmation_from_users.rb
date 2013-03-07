class RemovePasswordConfirmationFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :password_confirmation
  end

  def down
    add_column :users, :password_digest, :string
  end
end
