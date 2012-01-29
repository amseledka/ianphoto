class Contestant < ActiveRecord::Base
  CATEGORY_NAMES = ["category1", "category2"]

  has_many :categories
  accepts_nested_attributes_for :categories

  has_many :photos, :through => :categories

  def to_s
    [first_name, last_name].compact.join(" ")
  end

  def build_categories
    CATEGORY_NAMES.each do |category_name|
      c = categories.build(:name => category_name)
      2.times {c.photos.build}
    end
  end
end
