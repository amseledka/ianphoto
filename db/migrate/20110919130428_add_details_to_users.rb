class AddDetailsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :about, :text
    add_column :users, :avatar_file_name, :string
    add_column :users, :avatar_content_type, :string
    add_column :users, :avatar_file_size, :integer
  end

  def self.down
    remove_column :users, :about
    remove_column :users, :last_name
    remove_column :users, :first_name
    remove_column :users, :username
    remove_column :users, :avatar_file_name
    remove_column :users, :avatar_content_type
    remove_column :users, :avatar_file_size
  end
end
