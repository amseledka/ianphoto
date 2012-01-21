class User < ActiveRecord::Base
  belongs_to :invite

  acts_as_authentic do |c|
     c.login_field = :email
    c.validate_login_field = false
  end

  has_many :categories
  has_many :photos, :through => :categories
  has_many :calendar_records
  has_attached_file :avatar, :styles => { :small => "600x600>", :thumb => "200x", :vertical_thumb => "x160", :icon => "24x24#" }, :default_url => '/images/no_avatar.png'
  
  validates :password, :presence => true, :confirmation => true, :length => { :within => 4..40 }, :if => lambda {new_record? or password_changed?}
  validates :password_confirmation, :presence => true, :if => lambda {new_record? or password_changed?}
  validates :email, :uniqueness => true, :presence => true , :if => lambda {new_record? or email_changed?}
  
  validates_presence_of :invite_id, :on => :create
  validates_associated :invite, :on => :create
  after_create :redeem_invite

  default_scope where(:hidden.not_eq => true)
  scope :shuffled, order("random()")

  def to_s
    full_name.blank? ? email : full_name
  end

  def full_name
    [first_name, last_name].join(" ").strip 
  end

  def avatar_from_remote_url(url) #for testing purposes
    begin
      self.avatar = open(URI.parse(url))
    rescue
      return nil
    end
    picture_extension = self.avatar.content_type.split("/").last
    self.avatar.instance_write(:file_name, [ActiveSupport::SecureRandom.hex(16), picture_extension].join("."))
  end

  protected
    def redeem_invite
      invite.redeem!
    end
  
end
