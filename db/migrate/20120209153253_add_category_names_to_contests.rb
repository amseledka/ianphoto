class AddCategoryNamesToContests < ActiveRecord::Migration
  def self.up
    add_column :contests, :category_names, :text
  end

  def self.down
    remove_column :contests, :category_names
  end
end
