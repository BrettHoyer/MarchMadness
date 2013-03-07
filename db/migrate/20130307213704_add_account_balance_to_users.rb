class AddAccountBalanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_balance, :integer, :default => 1000
  end
end
