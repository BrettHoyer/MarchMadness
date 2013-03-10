class LeaderboardController < ApplicationController
  def index
  	@users=User.all
  end
end
