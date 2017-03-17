class SessionsController < ApplicationController

	def create
	  session[:password] = params[:password]
	  flash[:info] = "Successfully logged in"
	  redirect_to home_path
	end

	def destroy
	  reset_session
	  flash[:info] = "Successfully logged out"
	  redirect_to login_path
	end



end
