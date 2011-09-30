# encoding: utf-8
class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    invite_code = params[:invite_code]
    @invite = Invite.find_redeemable(invite_code)

    if invite_code && @invite
      if @user.save
        @invite.redeemed!
        redirect_to(:root, :notice => 'Успешная регистрация.')
      else
        render :action => "new"
      end
    else
      render(:action => "new", :notice => "Sorry, that code is not redeemable")
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to(edit_user_path(current_user), :notice => 'Изменения сохранены.')
    else
      render :action => 'edit'
    end
  end

  def calendar
  end

end
