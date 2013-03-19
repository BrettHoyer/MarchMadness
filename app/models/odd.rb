class Odd < ActiveRecord::Base
  attr_accessible :away_line, :game_id, :game_teams, :game_time, :home_line, :game_date
	
	require 'open-uri'
	require 'nokogiri'

	def self.update_odds

		doc= Nokogiri::HTML(open('http://www.scoresandodds.com/index.html'))

		@date = doc.css('#nba .date').text
		games = doc.css('td#contentMain .gameSection #bkc+.rightShadow')


		games_count = games.css('.time').count
		game_number = 0

			Odd.destroy_all

			games_count.times do |game_number|
				@odd = Odd.new	
				
				@odd.game_date = @date.split("/")[1]
				@odd.game_time = games.css('.time')[game_number].text 	

				if games.css('.odd .currentline')[game_number].text[0] == "-"
					@odd.away_line = games.css('.odd .currentline')[game_number].text
					@odd.home_line = games.css('.odd .currentline')[game_number].text.gsub("-", "+")
				elsif games.css('.even .currentline')[game_number].text == ("PK " || "PK")
					@odd.away_line = "0"
					@odd.home_line = "0"
				else
					@odd.away_line = games.css('.even .currentline')[game_number].text.gsub("-", "+")
					@odd.home_line = games.css('.even .currentline')[game_number].text
				end

					@odd.game_teams = games.css('.odd .name')[game_number].text.split(" ", 2).last.upcase + ' vs. ' + games.css('.even .name')[game_number].text.split(" ", 2).last.upcase
					
					
					@odd.away_id = games.css('.odd .name')[game_number].text.split(" ", 2).first.upcase
					@odd.home_id = games.css('.even .name')[game_number].text.split(" ", 2).first.upcase
					@odd.save

			end

 	
	end





end
