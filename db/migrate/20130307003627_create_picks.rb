class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :user_id
      t.boolean :away_picked
      t.boolean :home_picked
      t.integer :game_id
      t.string :game_teams
      t.string :line

      t.timestamps
    end
  end
end
