class CreateOdds < ActiveRecord::Migration
  def change
    create_table :odds do |t|
      t.string :game_id
      t.string :game_time
      t.string :game_teams
      t.string :home_line
      t.string :away_line

      t.timestamps
    end
  end
end
