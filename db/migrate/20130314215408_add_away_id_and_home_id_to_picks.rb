class AddAwayIdAndHomeIdToPicks < ActiveRecord::Migration
  def change
  	add_column :picks, :away_id, :string
  	add_column :picks, :home_id, :string
  end
end
