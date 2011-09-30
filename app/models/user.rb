class User < ActiveRecord::Base
  acts_as_authentic do |c|
     c.login_field = :email
    c.validate_login_field = false
  end

  has_many :categories
  has_many :photos, :through => :categories
  has_many :calendar_records
  has_attached_file :avatar, :styles => { :small => "600x600>", :thumb => "300x300>" }, :default_url => '/images/no_avatar.png'

  attr_accessible :email, :password, :password_confirmation

  validates :password, :presence => true, :confirmation => true, :length => { :within => 4..40 }
  validates :password_confirmation, :presence => true
  validates :email, :presence => true, :on => :create
  
=begin
# validate exclude reg key that has used field value = true
  validates :registration_key, :if => :free_registration_key?, :message => "Registration key %{value} has already been used."

private
  def self.free_registration_key?
    #user.registration_key.regestration_key.where(:registration_key => :registration_key, :used => :false).first
    RegistrationKey.not_used.where(:registration_key => registration_key).exists?
  end

  after_create do |registration_key|
    userd_id => user_id
    used => true
  end
=end
end

