class StaticPagesController < ApplicationController
  def index
    @static_pages = StaticPage.all
  end
  def show
    @static_page = StaticPage.find_by_slug(params[:slug])
    respond_to do |format|
      format.html { @photo = Photo.shuffled.first }
    end
  end

end
