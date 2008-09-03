# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :check_permissions, :only => ['new', 'edit', 'destroy']
  
  #before_filter :login_required, :only => ['new', 'edit', 'destroy']
  helper :all # include all helpers, all the time
  include AuthenticatedSystem

  
  #before_filter :login_required
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '5b6d2c4c78f79fee9ba44e28d7532798'
  
  private
  
  def check_permissions
    if !authorized?
	  flash[:notice] = 'Access denied. Please log in first.'
	  redirect_to :action => 'new', :controller => 'sessions'
	end
  end
  
 
end
