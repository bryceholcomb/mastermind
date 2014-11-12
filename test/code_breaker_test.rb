gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require_relative '../lib/code_breaker'

class CodeBreakerTest < Minitest::Test
  def test_it_exists
    assert CodeBreaker
  end

  def test_it_starts_with_zero_guesses
    player = CodeBreaker.new
    assert_equal 0, player.guesses.count
  end

  def test_guesses_increases_by_one_with_each_valid_guess
    player = CodeBreaker.new
    player.make_guess(StringIO.new('rrrr'))
    player.add_guess
    player.make_guess(StringIO.new('gggg'))
    player.add_guess
    assert_equal 2, player.guesses.count
  end

  def test_guesses_contains_exact_matches_to_each_guess
    player = CodeBreaker.new
    player.make_guess(StringIO.new('rrrr'))
    player.add_guess
    player.make_guess(StringIO.new('gggg'))
    player.add_guess
    assert_equal ['rrrr', 'gggg'], player.guesses
  end

  def test_it_formats_input_into_a_formatted_guess
    player = CodeBreaker.new
    player.make_guess(StringIO.new('rrrr'))
    assert_equal ["R", "R", "R", "R"], player.formatted_guess

    assert_equal 'rrrr', player.guess
  end
end
