module ApplicationHelper
  def create_time(application_deadline)
    date = application_deadline.chomp
    date = Date.strptime(application_deadline, '%Y年%m月%d日')
    current_date = Date.current
    (date - current_date).numerator
  end
end
