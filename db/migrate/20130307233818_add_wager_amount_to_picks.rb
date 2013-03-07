class AddWagerAmountToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :wager_amount, :integer
  end
end
