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
    if @user.save
      redirect_to(:root, :notice => 'Успешная регистрация.')
    else
      render :action => 'new'
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
