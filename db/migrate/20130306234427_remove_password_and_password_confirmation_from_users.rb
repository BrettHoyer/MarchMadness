class RemovePasswordAndPasswordConfirmationFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :password, :string
  	remove_column :users, :password_confirmation, :string
  end
end
