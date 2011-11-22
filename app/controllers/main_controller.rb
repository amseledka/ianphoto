class MainController < ApplicationController
  def index
    @photos = Photo.shuffled.take(20)
    @big_photo = @photos.shift
    @static_pages = StaticPage.latest.take(3)
    @users = User.shuffled - [@big_photo.user]
  end
end
