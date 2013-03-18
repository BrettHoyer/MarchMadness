class AddHomeIdAndAwayIdToOdds < ActiveRecord::Migration
  def change
  	add_column :odds, :away_id, :string
  	add_column :odds, :home_id, :string
  end
end
