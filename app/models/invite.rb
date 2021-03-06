require 'digest/sha1'

class Invite < ActiveRecord::Base
  
  has_one :user
  
  validates_presence_of :email, :on => :save, :message => "can't be blank"
  validates_uniqueness_of :email, :on => :save, :message => "is already registered"

  after_create :generate_code!, :send_invitation

  scope :unsent, where(:invite_code => nil)
  scope :not_redeemed, where(:redeemed_at => nil)

  def invited?
    invite_code?
  end
  
  def self.find_redeemable(invite_code)
    not_redeemed.find_by_invite_code(invite_code)
  end

  def redeem!
    self.redeemed_at = Time.zone.now #respect current time zone
    self.save!
  end

  def redeemed?
    redeemed_at?
  end

  def invited_at
    created_at
  end

  protected
    def generate_code!
      self.invite_code = Digest::SHA1.hexdigest("--#{Time.now.utc.to_s}--#{self.email}--")
      save!
    end
    
    def send_invitation
      return if Rails.env.development?
      mail = InvitationMailer.invite(self)
      mail.deliver
    end
end
