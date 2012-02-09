class Admin::StaticPagesController < ApplicationController
  uses_tiny_mce

  def new
    @static_page = StaticPage.new
  end

  def create
    @static_page = StaticPage.new(params[:static_page])
    if @static_page.save
      redirect_to :publications
    else
      render :new
    end
  end

  def edit
    @static_page = StaticPage.find(params[:id])
  end

  def update
    @static_page = StaticPage.find(params[:id])
    if @static_page.update_attributes(params[:static_page])
      redirect_to :publications
    else
      render :edit
    end
  end

  def destroy
    @static_page = StaticPage.find(params[:id])
    @static_page.destroy
    redirect_to :publications
  end

end
