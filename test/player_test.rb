gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require_relative '../lib/player'

class PlayerTest < Minitest::Test
  def test_it_exists
    assert Player
  end

  def test_it_starts_with_zero_guesses
    player = Player.new
    assert_equal 0, player.guesses.count
  end

  def test_guesses_increases_by_one_with_each_turn
    player = Player.new
    player.take_turn
  end
end
