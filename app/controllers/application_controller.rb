class ApplicationController < ActionController::Base
#  check_authorization

  include Authentication

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
#  before_filter { |c| Authorization.current_user = c.current_user }
#  before_filter :set_current_user

  protected


  def permission_denied
  #    notice[:error] = t "global.restricted"
  #    redirect_to root_url
      redirect_to(root_path, :alert => [t "global.restricted"])
    end
  def session_expired
    redirect_to(root_path, :alert => [t "global.expired_session"])
  #    notice[:error] = t "global.expired_session"
  #    redirect_to root_url
    end

end
