class Admin::CalendarRecordsController < ApplicationController

  def index
    @calendar_records = current_user.calendar_records.all
    @calendar_record = current_user.calendar_records.new
  end
  
  def create
    params[:calendar_record][:user_id] = current_user.id
    CalendarRecord.toggle!(params[:calendar_record])
    render :text => :ok
  end
  
end