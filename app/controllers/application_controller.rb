class ApplicationController < ActionController::Base
#  check_authorization

  include Authentication

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
#  before_filter { |c| Authorization.current_user = c.current_user }
#  before_filter :set_current_user


# Used to notify user that they have tried to request a restricted action. Refer to log for more details
rescue_from CanCan::AccessDenied do
      flash[:alert] = [t "global.access_denied"]
      redirect_to root_url
    end
  protected


  def session_expired
    redirect_to(root_path, :alert => [t "global.expired_session"])

  end

end
