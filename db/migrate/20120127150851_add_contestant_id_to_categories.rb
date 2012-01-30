class AddContestantIdToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :contestant_id, :integer
  end

  def self.down
    remove_column :categories, :contestant_id
  end
end
