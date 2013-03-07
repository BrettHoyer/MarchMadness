class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :user_id
      t.string :game_id
      t.string :game_teams
      t.string :line
      t.string :home_or_away
      t.boolean :win_or_lose

      t.timestamps
    end
  end
end
