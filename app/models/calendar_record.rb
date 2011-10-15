class CalendarRecord < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  validates_uniqueness_of :date, :scope => :user_id

  def self.toggle!(options)
    @calendar_record = CalendarRecord.where(options)
      if @calendar_records.exists?
        @calendar_record.destroy
      else
        @calendar_record.create(options)
      end
  end
  
  def self.by_date(date)
    CalendarRecord.find_or_initialize_by_date(date)
  end

end
