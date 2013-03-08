class Pick < ActiveRecord::Base
  attr_accessible :game_id, :game_teams, :home_or_away, :line, :user_id, :win_or_lose, :wager_amount

   belongs_to :user

   after_save :reduce_user_account_balance

   def reduce_user_account_balance
   		@user=User.find_by_id(self.user_id)
   		@user.account_balance -= self.wager_amount
   		@user.save
   	end

end
