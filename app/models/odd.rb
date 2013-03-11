class Odd < ActiveRecord::Base
  attr_accessible :away_line, :game_id, :game_teams, :game_time, :home_line
	
	require 'open-uri'
	require 'xmlsimple'

	def self.update_odds

		key="97429b5a-2486-e211-b97f-003048dd52d5"

		odds="http://xmlfeed.intertops.com/xmloddsfeed/v2/xml/?apikey=#{key}&delta=500&sportId=5&catId=1068"

		odds_xml = open(URI.parse(odds))

		config = XmlSimple.xml_in(odds_xml, { 'KeyAttr' => 'name' })

		all_games_info=Array.new

		 config['data'][0]['s'][0]['cat'][0]['m'].each do |game|
		 	@odd=Odd.new
		 	@odd.game_time = game["dt"]
		 	@odd.game_id = game["id"]
		 	@odd.game_teams = game['n']
		 	if game['t']
			 	game['t'].each do |bet_type|
			 		if bet_type["n"] == "Moving Line"
						@odd.away_line = bet_type['l'][0]["p"] 
			 			@odd.home_line= bet_type['l'][1]['p']
			 		end
			 	end
			 end
			 @odd.save
		 end
 	
	end








end
