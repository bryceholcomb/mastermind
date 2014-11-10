gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require_relative '../lib/game'

class GameTest < Minitest::Test
  #use StringIO.new('rrrg') to stub out the input when testing the REPL

  def test_when_player_chooses_i_the_instructions_are_printed

  end

  def test_when_player_chooses_q_the_game_ends

  end

  def test_compare_method_is_called

  end

  def test_play_method_is_called

  end

  def test_code_is_created_when_game_played
    mastermind = Game.new
    mastermind.create_hidden_code
    assert_equal "rrgg", mastermind.hidden_code
  end

end
