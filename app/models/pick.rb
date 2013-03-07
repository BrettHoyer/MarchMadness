class Pick < ActiveRecord::Base
  attr_accessible :game_id, :game_teams, :home_or_away, :line, :user_id, :win_or_lose
end
