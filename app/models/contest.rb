class Contest < ActiveRecord::Base
  validates_presence_of :name, :description
  after_save :deactivate_other_contests, :if => :active?

  has_many :contestants, :dependent => :destroy

  def self.current
    Contest.where(:active => true).first
  end

  def categories
    self.category_names.to_s.gsub("\r\n", "\n").gsub("\r", "\n").split("\n")
  end

  private
    def deactivate_other_contests
      Contest.where("id != ?", self.id).update_all(:active => false)
    end
end
