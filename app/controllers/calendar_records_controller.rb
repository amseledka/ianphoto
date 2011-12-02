class CalendarRecordsController < ApplicationController
  def index
    @all_users = User.all
    @month = params.fetch(:month, Date.today.beginning_of_month)
    @month = Time.zone.parse(@month).to_date unless @month.is_a? Date
    @calendar_records = CalendarRecord.month(@month).includes(:user).grouped_by_timestamp
  end
end
