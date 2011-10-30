class CalendarRecordsController < ApplicationController
  def index
    @calendar_records = CalendarRecord.full_year.grouped_by_timestamp
  end
end
