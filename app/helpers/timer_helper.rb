module TimerHelper

  def timer_string
    seconds = $time_limit_sec - Time.now.to_i
    seconds = 0 if seconds < 0
    hour = seconds / 60 / 60
    min = seconds / 60
    sec = seconds % 60
    hour = "0" + hour.to_s if (hour < 10)
    min = "0" + min.to_s if (min < 10)
    sec = "0" + sec.to_s if (sec < 10)
    hour.to_s + ":" + min.to_s + ":" + sec.to_s
  end

  def time_response
    seconds = $time_limit_sec - Time.now.to_i
    seconds = 0 if seconds < 0
    seconds
  end
end
