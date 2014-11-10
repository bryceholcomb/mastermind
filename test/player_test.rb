gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/player'

class PlayerTest < Minitest::Test
  def test_player_starts_with_zero_guesses
    player = Player.new
    assert_equal 0, player.guesses.size
  end

  def test_guesses_increase_by_one_when_player_guesses
    player = Player.new
    player.take_turn('rrrr')
    player.take_turn('GGGG')
    player.take_turn('YYBB')
    assert_equal 3, player.guesses.size
  end

  def test_formatted_guess_upcases_and_chars_submitted_guess
    player = Player.new
    player.take_turn('rrRR')
    assert_equal ['R', 'R', 'R', 'R'], player.formatted_guess
  end
end
