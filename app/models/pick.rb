class Pick < ActiveRecord::Base
require 'open-uri'
require 'nokogiri'
  attr_accessible :game_id, :game_time, :game_teams, :home_or_away, :line, :user_id, :win_or_lose, :wager_amount, :away_id, :home_id

  validates_presence_of :line, :wager_amount, :user_id, :game_teams, :home_or_away

   belongs_to :user

   after_save :reduce_user_account_balance

   after_update :update_user_account_balance

   def reduce_user_account_balance
   		@user=User.find_by_id(self.user_id)
   		if self.win_or_lose == nil
   		@user.account_balance -= self.wager_amount
   		@user.save
   		end
   	end

   	def update_user_account_balance
  		@user=User.find_by_id(self.user_id)
  		if self.win_or_lose == "win"
   		@user.account_balance += 2*self.wager_amount
   		@user.save
 		  end
   	end

    def self.update_win_or_lose
      @picks = Pick.where(:win_or_lose => nil)
      @picks.each do |pick|
        doc= Nokogiri::HTML(open('http://www.scoresandodds.com/index.html'))
        games = doc.css('td#contentMain .gameSection #bkc+.rightShadow')
        if games.css('.odd .finalscore').css("td[id$='#{pick.away_id}'] span").first != nil
          away_score = games.css('.odd .finalscore').css("td[id$='#{pick.away_id}'] span").first.text.to_i
          home_score = games.css('.even .finalscore').css("td[id$='#{pick.home_id}'] span").first.text.to_i
          line = pick.line.to_i

          if pick.home_or_away == "Home" && ((home_score-away_score) + line) > 0
            pick.win_or_lose = "win"
            pick.save
          elsif pick.home_or_away == "Home" && ((home_score-away_score) + line) < 0
            pick.win_or_lose = "loss"
            pick.save
          elsif pick.home_or_away == "Home" && ((home_score-away_score) + line) == 0
            pick.win_or_lose = "push"
            pick.save  
          elsif pick.home_or_away == "Away" && ((away_score-home_score) - line) > 0
            pick.win_or_lose = "win"
            pick.save 
          elsif pick.home_or_away == "Away" && ((away_score-home_score) - line) < 0
            pick.win_or_lose = "loss"
            pick.save
          elsif pick.home_or_away == "Away" && ((away_score-home_score) - line) == 0
            pick.win_or_lose = "push"
            pick.save 
          end
        end
      end
    end


end
