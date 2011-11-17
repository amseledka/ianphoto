# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

def fetch_images(query, page = 0)
  require 'open-uri'
  offset = page * 8;
  begin
    response = open("https://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=8&start=#{offset}&q=#{URI::encode query}").read
    return ActiveSupport::JSON.decode(response)["responseData"]["results"].map {|i| i["url"]}
  rescue
    return nil
  end
end

avatars = fetch_images("photographer").shuffle
7.times do |i|
  invite = Invite.create
  user = User.new(
    :first_name => Vydumschik::Name.first_name,
    :last_name => Vydumschik::Name.surname,
    :email => "test00#{i}@test.com",
    :password => "pass00#{i}",
    :password_confirmation => "pass00#{i}",
    :price => (rand * 1000 + 1000).to_i,
    :phone => "097-123-45-67",
    :city => Vydumschik::Lorem.word.capitalize,
    :about => Vydumschik::Lorem.paragraph,
    :skype => "skype",
    :invite => invite
  )
  user.avatar_from_remote_url(avatars.shift)
  user.save!

  pictures = []
  rand(10).times do |i|
    pictures = pictures + Array.wrap(fetch_images("wedding", i))
    pictures.shuffle!
    category = user.categories.create(:name => Vydumschik::Lorem.word)
    puts "Added category #{category.name} to user #{user}"
    rand(8).times do |j|
      photo = category.photos.new(:name => Vydumschik::Lorem.word)
      photo.picture_from_remote_url(pictures[j])
      photo.save
      puts "Added photo to category #{category}"
    end
  end
end

10.times do |i|
  StaticPage.create(:name => Vydumschik::Lorem.word, :slug => "page#{i}", :body => Vydumschik::Lorem.paragraph)
end
