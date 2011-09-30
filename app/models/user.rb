class User < ActiveRecord::Base
  acts_as_authentic do |c|
     c.login_field = :email
    c.validate_login_field = false
      
  end

  attr_accessible :email, :password, :password_confirmation, :registration_key  

  validates :password, :presence => true, :length => { :within => 6..40 }
  validates_presence_of :email, :registration_key

  has_many :categories
  has_many :photos, :through => :categories
  has_one :registration_key
  has_attached_file :avatar, :styles => { :small => "600x600>", :thumb => "300x300>" }, :default_url => '/images/no_avatar.png'
end
