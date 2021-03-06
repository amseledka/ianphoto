# encoding: utf-8
class UsersController < ApplicationController
  uses_tiny_mce

  def show
    @user = User.find(params[:id])
    @categories = @user.categories.not_empty
  end
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @invite_code = params.delete(:invite_code)
    @invite = Invite.find_by_invite_code!(@invite_code)
    @user.email = @invite.email
    session[:invite_code] = @invite_code #invite code is passed here, not in create
  end

  def create
    @user = User.new(params[:user])
    @user.invite = Invite.find_redeemable(session[:invite_code])
    if @user.save
      session.delete(:invite_code)
      redirect_to(:root, :notice => 'Успешная регистрация.')
    else
      render(:action => "new", :notice => "Зарегистироваться можно только если вас пригласили")
    end
  end

  def edit
    @user = current_user
  end
  
  def edit_account
    @user = current_user
  end

  def calendar
    @month = params[:month] ? Time.zone.parse(params[:month]).to_date : Date.today.beginning_of_month
    @user = User.find(params[:id])
    render :layout => false
  end
  
  def edit_calendar
    @month = params[:month] ? Time.zone.parse(params[:month]).to_date : Date.today.beginning_of_month
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to(edit_user_path(@user), :notice => 'Изменения сохранены.')
    else
      render params.fetch(:on, :edit)
    end
  end
  
end
