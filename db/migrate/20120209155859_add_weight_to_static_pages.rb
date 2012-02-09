class AddWeightToStaticPages < ActiveRecord::Migration
  def self.up
    add_column :static_pages, :weight, :integer
  end

  def self.down
    remove_column :static_pages, :weight
  end
end
