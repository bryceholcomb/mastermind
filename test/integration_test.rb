gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'
require_relative '../lib/player'

class IntegrationTest < Minitest::Test


  def test_create_new_game_with_hidden_code
    skip
    mastermind = Game.new
    mastermind.create_hidden_code
    assert_equal "rrrr", mastermind.hidden_code

    assert_equal "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?",
    mastermind.guess_instructions
  end

  def test_evaluates_player_sequence_and_returns_feedback
    skip
    mastermind = Game.new
    player = Player.new
    mastermind.create_hidden_code
    player.guess("rrgg")
    assert_equal "'RRGG' has 3 of the correct elements with 2 in the correct positions\nYou've taken 1 guess", mastermind.feedback

  end

  def test_when_player_chooses_q_the_game_ends_and_stats_are_printed
    mastermind = Game.new
    mastermind.create_hidden_code
    player.guess('rrgg')
    assert_equal "Congratulations! You guessed the sequence 'RRGG' in 1 guess(es)\nDo you want to (p)lay again or (q)uit?",
    mastermind.print_stats
  end
end
