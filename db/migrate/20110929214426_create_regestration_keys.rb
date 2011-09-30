class CreateRegestrationKeys < ActiveRecord::Migration
  def self.up
    create_table :regestration_keys do |t|
      t.string :registration_key
      t.boolean :used, :default => false
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :regestration_keys
  end
end
