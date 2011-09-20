class User < ActiveRecord::Base
  acts_as_authentic
  has_many :categories
  has_many :photos, :through => :categories
  has_attached_file :avatar, :styles => { :small => "200x200>", :thumb => "100x100>" }
end
