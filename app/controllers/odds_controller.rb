class OddsController < ApplicationController
	require 'open-uri'
	require 'xmlsimple'

	before_filter :require_login

	def index
		@user=User.find_by_id(session[:user_id])
		@pick=Pick.new
		@picks=Pick.where(:user_id => session[:user_id])

		key="97429b5a-2486-e211-b97f-003048dd52d5"

		odds="http://xmlfeed.intertops.com/xmloddsfeed/v2/xml/?apikey=#{key}&delta=500&sportId=5&catId=1068"

		odds_xml = open(URI.parse(odds))

		config = XmlSimple.xml_in(odds_xml, { 'KeyAttr' => 'name' })

		all_games_info=Array.new

		 config['data'][0]['s'][0]['cat'][0]['m'].each do |game|
		 	game_info=Hash.new
		 	game_info["game_time"] = game["dt"]
		 	game_info["game_id"] = game["id"]
		 	game_info["game_teams"] = game['n']
		 	if game['t']
			 	game['t'].each do |bet_type|
			 		if bet_type["n"] == "Moving Line"
			 			game_info["away_line"] = bet_type['l'][0]["p"] 
			 			game_info["home_line"] = bet_type['l'][1]['p']
			 		end
			 	end
			 end
		 	all_games_info << game_info
		 end
 	
 		@all_games_info = all_games_info
		
	end
end
