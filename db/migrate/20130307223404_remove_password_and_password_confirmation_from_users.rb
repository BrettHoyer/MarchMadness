class RemovePasswordAndPasswordConfirmationFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :password
  	remove_column :users, :password_confirmation
  end
end
