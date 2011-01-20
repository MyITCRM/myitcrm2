class ApplicationController < ActionController::Base
  include Authentication

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
#  before_filter { |c| Authorization.current_user = c.current_user }
  before_filter :set_current_user

  # Scrub sensitive parameters from your log
#  filter_parameter_logging :password, :password_confirmation



  protected
   def set_current_user
     Authorization.current_user = current_user
   end

def permission_denied
    flash[:error] = t "global.restricted"
    redirect_to root
  end
def session_expired
    flash[:error] = t "global.expired_session"
    redirect_to root_url
  end

end
