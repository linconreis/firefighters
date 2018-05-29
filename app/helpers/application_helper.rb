module ApplicationHelper

  def format_date(date_time)
    date_time.strftime("%d/%m/%Y")
  end

  def format_time(date_time)
    date_time.strftime('%Hh:%Mmin')
  end
  
end
