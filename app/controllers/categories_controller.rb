class CategoriesController < ApplicationController
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
