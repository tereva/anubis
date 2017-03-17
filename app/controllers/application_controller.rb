class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	helper_method :admin?

	protected

	def admin?
	session[:password] == 'aitapeapea'
	end

	def authorize
	  unless admin?
	    flash[:danger] = "unauthorized access"
	    redirect_to login_path
	    false
	  end
	end


end
