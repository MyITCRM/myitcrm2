class ApplicationController < ActionController::Base
include Authentication
require 'redcloth3'

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details



# Used to notify user that they have tried to request a restricted action. Refer to log for more details
  rescue_from CanCan::AccessDenied do
    flash[:alert] = t "global.access_denied"
    redirect_to root_url
  end


end
