class RemoveDescriptionFromPhotos < ActiveRecord::Migration
  def self.up
    remove_column :photos, :description
  end

  def self.down
    add_column :photos, :description, :text
  end
end
