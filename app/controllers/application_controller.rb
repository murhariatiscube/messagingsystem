class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protect_from_forgery
  
  private
   
	def authorize_access
	  if !session[:user_id]
	    flash[:notice] = "Please log in."
	    redirect_to(:controller => 'users', :action => 'login')
	    return false
	  end	
	end
  
end
