class AddContestIdToContestants < ActiveRecord::Migration
  def self.up
    add_column :contestants, :contest_id, :integer
  end

  def self.down
    remove_column :contestants, :contest_id
  end
end
