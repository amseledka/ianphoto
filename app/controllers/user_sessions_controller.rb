class UserSessionsController < ApplicationController
 # before_filter :require_no_user, :only => [:new, :create]
 # before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to(:root, :notice => 'Login successfull.')
    else
      render :action => :new
    end
  end

  def destroy
#    current_user_session.destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to(:root, :notice => 'Logout successfull.')
  end
end

