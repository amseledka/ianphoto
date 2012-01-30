class CreateContestants < ActiveRecord::Migration
  def self.up
    create_table :contestants do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :city

      t.timestamps
    end
  end

  def self.down
    drop_table :contestants
  end
end
