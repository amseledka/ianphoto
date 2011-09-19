class User < ActiveRecord::Base
  acts_as_authentic
  has_many :categories
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
