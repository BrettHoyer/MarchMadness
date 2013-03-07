class RemoveHomePickedAndAwayPickedFromPicks < ActiveRecord::Migration
  def change
  	remove_column :picks, :home_picked, :boolean
  	remove_column :picks, :away_picked, :boolean
  end
end
