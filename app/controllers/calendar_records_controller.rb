class CalendarRecordsController < ApplicationController
  def index
    @all_users = User.all
    @calendar_records = CalendarRecord.full_year.includes(:user).grouped_by_timestamp
  end
end
