class PhotosController < ApplicationController
  def index
    @photos = @category.photos.all
    @category = Category.find(params[:id])
  end

  def show
    @photo = Photo.find(params[:id])
    @json_collection = Photo.from_category(@photo.category_id).to_json_collection(:current => @photo) do |photo|
      photo[:path] = photo_path(photo[:id])
    end
    @static_pages = StaticPage.all
  end

end
