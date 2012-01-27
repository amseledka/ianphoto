class CategoriesController < ApplicationController
  def new
    @category = Category.new
    5.times {@category.photos.build}
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def index
    @user = User.find(params[:user_id])
    @categories = @user.categories.all
  end
  
  def show
    @category = Category.find(params[:id])
    @user = @category.user
    unless @category.photos.present?
     redirect_to user_categories_path(@user.id)
    end
  end
  
end