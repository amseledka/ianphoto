class MainController < ApplicationController
  def index
    @photos = Photo.shuffled.take(12)
    @big_photo = @photos.shift
    @static_pages = StaticPage.latest.take(3)
  end
end
