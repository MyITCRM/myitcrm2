class UserSessionsController < ApplicationController
  before_filter :logged_in?, :only => :destroy

  # Lets a guest user access the new and create actions for the login page of this application
  skip_authorization_check :only => [:new, :create]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
      if @user_session.save
        flash[:success] = t("user.login_success")
        redirect_to_target_or_default work_orders_url
      else
        flash[:alert] = t "user.login_incorrect"
        redirect_to_target_or_default login_path
      end
    end
  def destroy
    @title = t "global.logout"
    @user_session = UserSession.find
    @user_session.destroy
    flash[:success] = t("user.logout_success")
     redirect_to_target_or_default root_url
    end
  end
