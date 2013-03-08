class ChangeColumnAccountBalanceInUsers < ActiveRecord::Migration
  def change
  	change_column :users, :account_balance, :integer, :default => 1000
  end
end
