gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/timer'

class TimerTest < Minitest::Test
  def setup
    @timer = Timer.new
  end

  def test_there_is_a_timer
    assert Timer
  end

  def test_a_timer_is_created_with_a_start_time
    assert @timer.start_time
    assert_equal Time, @timer.start_time.class
  end

  def test_a_timer_has_an_ending_time_after_calling_the_stop_timer_method
    @timer.stop_timer
    assert @timer.end_time
    assert_equal Time, @timer.end_time.class
  end

  def test_stops_timer_and_calculates_minutes_and_seconds_elapsed
    @timer.calculate_time_elapsed
    assert @timer.minutes
    assert @timer.seconds
  end
end
