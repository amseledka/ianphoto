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
    @invite = Invite.find_redeemable(params[:invite_code])
      if @invite
        @user.save
          if @invite.redeemed!
          redirect_to(:root, :notice => 'Успешная регистрация.')
          else
            render(:action => "new", :notice => "Зарегестироваться можно только если вас пригласили")
          end
    else
      render(:action => "new", :notice => "Зарегестироваться можно только если вас пригласили")
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