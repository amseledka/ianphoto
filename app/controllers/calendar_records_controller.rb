class CalendarRecordsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @calendar_records = @user.calendar_records.all
  end

end
