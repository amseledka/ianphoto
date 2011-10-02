class User < ActiveRecord::Base
  acts_as_authentic
  has_many :categories
  has_many :photos, :through => :categories
  has_attached_file :avatar, :styles => { :small => "600x600>", :thumb => "300x300>" }, :default_url => '/images/no_avatar.png'
end
