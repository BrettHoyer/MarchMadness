class OddsController < ApplicationController
	require 'open-uri'
	require 'xmlsimple'
	require 'Nokogiri'

	before_filter :require_login

	def index
		@user=User.find_by_id(session[:user_id])
		@pick=Pick.new
		@picks=Pick.where(:user_id => session[:user_id])

		# 		doc= Nokogiri::HTML(open('http://www.scoresandodds.com/yesterday.html'))

		# games = doc.css('td#contentMain .gameSection #bkc+.rightShadow')

		# games_count = games.css('.time').count
		# game_number = 0

		# 	Odd.destroy_all
			
		# 	games_count.times do |game_number|
		# 		@odd = Odd.new	
				
		# 		@odd.game_time = games.css('.time')[game_number].text		
				
		# 		if games.css('.odd .currentline')[game_number].text[0] == "-"
		# 			@odd.away_line = games.css('.odd .currentline')[game_number].text
		# 			@odd.home_line = games.css('.odd .currentline')[game_number].text.gsub("-", "+")
		# 		else
		# 			@odd.away_line = games.css('.even .currentline')[game_number].text.gsub("-", "+")
		# 			@odd.home_line = games.css('.even .currentline')[game_number].text
		# 		end

		# 			@odd.game_teams = games.css('.odd .name a')[game_number].text.split(" ", 2).last + " vs. " + games.css('.even .name a')[game_number].text.split(" ", 2).last
		# 			@odd.save

		# 	end

		@odds= Odd.all

		
	end
end
