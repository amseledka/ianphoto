class Admin::CalendarRecordsController < ApplicationController

  before_filter :toggle_calendar_record, :only => [:create, :update]

  def index
    @calendar_records = current_user.calendar_records.all
    @calendar_record = current_user.calendar_records.new
  end
  
  def create
    render :text => :ok
  end

  def update
    render :text => :ok
  end

  protected
    def toggle_calendar_record
      CalendarRecord.toggle!(params[:calendar_record].merge(:user_id => current_user.id))
    end
end
