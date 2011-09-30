class AddRegistrationKeyToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :registration_key, :string
    add_column :users, :registration_key_id, :integer
  end

  def self.down
    remove_column :users, :registration_key
    remove_column :users, :registration_key_id
  end
end
