class Admin::CalendarRecordsController < ApplicationController

  def index
    @calendar_records = current_user.calendar_records.all
    @calendar_record = current_user.calendar_records.new
  end
  
  def new
    @calendar_record = current_user.calendar_records.new
  end

  def create
    @calendar_record = current_user.calendar_records.new(params[:calendar_record])
    @calendar_record.save
  end
=begin
  def edit
    @calendar_record = current_user.calendar_records.find(params[:id])
  end

  def update
    @calendar_record = current_user.calendar_records.find(params[:id])
    @calendar_record.update_attributes(params[:calendar_records])
  end
=end
  def destroy
    @calendar_record = current_user.calendar_records.find(params[:id])
    @calendar_record.destroy
  end
  
end