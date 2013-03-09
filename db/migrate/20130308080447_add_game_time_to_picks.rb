class AddGameTimeToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :game_time, :string
  end
end
