class CreateCalendarRecords < ActiveRecord::Migration
  def self.up
    create_table :calendar_records do |t|
      t.datetime :date
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :calendar_records
  end
end
