class Pick < ActiveRecord::Base
  attr_accessible :home_or_away, :game_id, :game_teams, :line, :user_id

  validates_presence_of :home_or_away
end
