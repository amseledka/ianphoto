class CreateContests < ActiveRecord::Migration
  def self.up
    create_table :contests do |t|
      t.string :name
      t.text :description
      t.text :rules
      t.boolean :active, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :contests
  end
end
