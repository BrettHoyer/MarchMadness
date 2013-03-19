class ApplicationController < ActionController::Base
	def require_login
	  if session[:user_id].nil?
	      redirect_to sessions_new_url
	  end
  	end

  	def require_admin
  		if session[:user_id] != User.find_by_email("brett@example.com").id
  			redirect_to user_url(session[:user_id])
  		end
  	end	


  	
  protect_from_forgery
end
