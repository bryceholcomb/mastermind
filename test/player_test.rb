gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/player'

class PlayerTest < Minitest::Test
  def test_player_starts_with_zero_guesses
    player = Player.new
    assert_equal 0, player.guesses
  end

  def test_guesses_increase_by_one_when_player_guesses
    player = Player.new
    player.guess
    player.guess
    player.guess
    assert_equal 3, player.guesses
  end

  def test_player_starts_with_zero_submitted_sequences
    player = Player.new
    assert_equal [], player.sequences
  end

  def test_sequences_increase_by_one_with_each_guess
    player = Player.new
    player.guess
    player.guess
    assert_equal 2, player.sequences.count
  end

  def test_player_sequence_is_valid
    skip
    player = Player.new
    player.guess
    assert player.valid_guess?

    player.guess
    refute player.valid_guess?
  end

end
