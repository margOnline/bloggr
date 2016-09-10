module ApplicationHelper
  def format_time(time)
    "#{distance_of_time_in_words(Time.now, time)} ago"
  end
end
