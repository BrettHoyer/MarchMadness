class OddsController < ApplicationController
	require 'open-uri'
	require 'xmlsimple'

	before_filter :require_login

	def index
		@user=User.find_by_id(session[:user_id])
		@pick=Pick.new
		@picks=Pick.where(:user_id => session[:user_id])

		@odds= Odd.all

		
	end
end
