class UserSessionsController < ApplicationController
  before_filter :logged_in?, :only => :destroy

  def new
    @title = t "global.login"
    @user_session = UserSession.new
  end

  def create
    @title = t "global.login"
    @user_session = UserSession.new(params[:user_session])
      if @user_session.save
        flash[:notice] = t("user.login_success")
        redirect_to_target_or_default work_orders_url
      else
        redirect_to_target_or_default login_path
      end
    end
  def destroy
    @title = t "global.logout"
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = t("user.logout_success")
     redirect_to_target_or_default root_url
    end
  end
