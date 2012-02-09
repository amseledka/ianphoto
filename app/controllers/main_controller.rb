class MainController < ApplicationController
  def index
    @photos = Photo.shuffled.take(20)
    @big_photo = @photos.shift
    @static_pages = StaticPage.latest.take(2)
    @users = User.shuffled.take(2)
  end
end
