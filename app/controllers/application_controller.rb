class ApplicationController < ActionController::Base

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method  :current_user_session, :current_user, :logged_in?

# Used to notify user that they have tried to request a restricted action. Refer to log for more details
  rescue_from CanCan::AccessDenied do
    flash[:alert] = [t "global.access_denied"]
    redirect_to root_url
  end

 private
  def logged_in?
    current_user
  end

  def login_required
    unless logged_in?
      flash[:notice] = "You must first log in or sign up before accessing this page."
      store_target_location
      redirect_to login
    end
  end

  def redirect_to_target_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def store_target_location
    session[:return_to] = request.request_uri
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end


end
