class ApplicationController < ActionController::Base
	def require_login
	  if session[:user_id].nil?
	      redirect_to sessions_new_url
	  end
  	end
  protect_from_forgery
end
