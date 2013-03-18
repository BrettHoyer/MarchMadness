class AddGameDateToOdds < ActiveRecord::Migration
  def change
  	add_column :odds, :game_date, :string
  end
end
