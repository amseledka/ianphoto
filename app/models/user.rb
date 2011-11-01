class User < ActiveRecord::Base
  belongs_to :invite

  acts_as_authentic do |c|
     c.login_field = :email
    c.validate_login_field = false
  end

  has_many :categories
  has_many :photos, :through => :categories
  has_many :calendar_records
  has_attached_file :avatar, :styles => { :small => "600x600>", :thumb => "300x300>", :icon => "24x24#" }, :default_url => '/images/no_avatar.png'

  attr_accessible :email, :password, :password_confirmation

  validates :password, :presence => true, :confirmation => true, :length => { :within => 4..40 }
  validates :password_confirmation, :presence => true
  validates :email, :uniqueness => true, :presence => true, :on => :create
  validates_presence_of :invite_id
  validates_associated :invite

  after_create :redeem_invite

  def to_s
    email 
  end

  protected
    def redeem_invite
      invite.redeem!
    end
  
end
