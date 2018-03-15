module ApplicationHelper
  def create_time(application_deadline)
    date = Date.strptime(application_deadline, '%Y年%m月%d日')
    current_date = Date.current
    result = (date - current_date).numerator

    if result > 0
      return result
    else
      return 0
    end
  end
end
