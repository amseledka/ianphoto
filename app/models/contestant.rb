class Contestant < ActiveRecord::Base
  CATEGORY_NAMES = ["Постановочная (арт) свадебная фотография", "Репортажная свадебная фотография", "Портрет жениха", "Портрет невесты", "Эмоции"]

  has_many :categories
  accepts_nested_attributes_for :categories

  validates_presence_of :email, :first_name, :last_name, :city

  has_many :photos, :through => :categories

  belongs_to :contest
  before_save :set_contest

  def to_s
    [first_name, last_name].compact.join(" ")
  end

  def build_categories(category_names)
    category_names ||= CATEGORY_NAMES
    category_names.each do |category_name|
      c = categories.build(:name => category_name)
      2.times {c.photos.build}
    end
  end

  private
    def set_contest
      self.contest = Contest.current
    end
end
