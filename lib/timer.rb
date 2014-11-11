class Timer
  attr_reader :start_time, :end_time, :minutes, :seconds

  def initialize
    @start_time = Time.now
  end

  def calculate_time_elapsed
    time_elapsed
    seperate_into_minutes_and_seconds
  end

  def stop_timer
    @end_time = Time.now
  end

  def time_elapsed
    stop_timer
    @time_elapsed = @end_time.to_i - @start_time.to_i
  end

  def seperate_into_minutes_and_seconds
    @minutes, @seconds = time_elapsed.divmod(60)
  end
end

if __FILE__ == $0
  timer = Timer.new
  puts timer.start_time
  timer.calculate_time_elapsed
  puts timer.end_time
  puts timer.minutes
  puts timer.seconds
end
