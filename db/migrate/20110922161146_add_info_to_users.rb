class AddInfoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :price, :string
    add_column :users, :city, :string
    add_column :users, :phone, :string
    add_column :users, :skype, :string
  end

  def self.down
    remove_column :users, :skype
    remove_column :users, :phone
    remove_column :users, :city
    remove_column :users, :price
  end
end
