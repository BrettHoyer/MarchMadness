class SessionsController < ApplicationController
  def new
  end

  def create
  	@user=User.find_by_email(params[:email].downcase)
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to '/index'
  	end
  end

  def destroy
  end
end
