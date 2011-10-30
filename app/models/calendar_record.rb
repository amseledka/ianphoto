class CalendarRecord < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  validates_uniqueness_of :date, :scope => :user_id

  scope :full_year, lambda {where("calendar_records.date >= ?", 5.months.ago).where("calendar_records.date <= ?", 6.months.since)}

  def self.toggle!(options)
    @calendar_record = CalendarRecord.where(options).first
      if @calendar_record.present?
        @calendar_record.destroy
      else
        CalendarRecord.create(options)
      end
  end
  
  def self.by_date(date)
    CalendarRecord.scoped({}).find_or_initialize_by_date(date.midnight)
  end

  def self.grouped_by_timestamp
    CalendarRecord.scoped({}).group_by {|cr| cr.date.to_i}
  end
end
