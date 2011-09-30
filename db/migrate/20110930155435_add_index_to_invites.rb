class AddIndexToInvites < ActiveRecord::Migration
  def self.up
    change_table :invites do |t|
      t.index [:id, :email]
      t.index [:id, :invite_code]
    end
  end

  def self.down
    remove_column :invites, :email, :invite_code
  end
end
