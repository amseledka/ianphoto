class PhotosController < ApplicationController
  def index
  end

  def show
    @photo = Photo.find(params[:id])
    @user = @photo.user
    @contestant = @photo.contestant
    @json_collection = Photo.from_category(@photo.category_id).to_json_collection(:current => @photo) do |photo|
      photo[:path] = photo_path(photo[:id])
    end
    @static_pages = StaticPage.all
  end

end
