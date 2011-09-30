class CalendarRecord < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  validates_uniqueness_of :date, :scope => :user_id
end
