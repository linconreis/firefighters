class ReportsController < ApplicationController

  def index
  
  end

  def result
    @start_date = params[:event_log][:start_date]
    @end_date = params[:event_log][:end_date]
  
    @event_logs = EventLog.order(date: :desc).where(date: (@start_date)..@end_date)

    
    @event_log_groups = EventLog.where(date: (@start_date)..@end_date).group(:occurrence_type).count

    #@cars = Car.group(:manufacturer).select("id, manufacturer, COUNT(id) AS total_count, GROUP_CONCAT(id) AS car_ids")

    #@event_logs = EventLog.where(:date => start_date..end_date)
    #Comment.where('created_at BETWEEN ? AND ?', @selected_date.beginning_of_day, @selected_date.end_of_day)
    #@events = Event.where("scheduled_date_start between ? and ? ", start.to_date, sixWeeks.to_date)
    #@announcements = Announcement.where("publish = ? AND expires < ?", true, Date.today)
    #@event_logs = EventLog.find(:all, :conditions => ['date >= and date <=', date_initial, date_last])
    #@models = SomeModel.find(:all, :conditions => ['date >= ? and date <= ?', start_date, end_date])
    #Client.where("created_at >= :start_date AND created_at <= :end_date", {start_date: params[:start_date], end_date: params[:end_date]})
  end

private

def event_log_params
    params.require(:event_log).permit(:date, :exit_time, :return_time, :requester, :phone, :descriptive_memorial, :measures_taken, :comments, :climate_conditions, :finished, :number)
end

end
