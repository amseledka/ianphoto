class CalendarRecord < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  validates_uniqueness_of :date, :scope => :user_id

  scope :month, lambda {|month| where("calendar_records.date >= ?", month.beginning_of_month).where("calendar_records.date <= ?", month.end_of_month)}

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
