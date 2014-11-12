gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require_relative '../lib/game'

class GameTest < Minitest::Test

  def test_hidden_code_is_created
    game = Game.new($stdin, $stdout)
    assert game.hidden_code
  end

  def test_game_exits_when_player_chooses_q_or_quit
    game = Game.new($stdin, $stdout)
    player = CodeBreaker.new
    player.make_guess(StringIO.new('quit'))
    assert_equal 'quit', player.guess
    assert game.exit?
  end

  def test_game_exits_when_player_guess_matches_hidden_code
    game = Game.new($stdin, $stdout)
    player = CodeBreaker.new
    hidden_code = %w(R R R R)
    player.make_guess(StringIO.new('rrrr'))
    assert_equal ["R", "R", "R", "R"], player.formatted_guess

    CompareCodes.match?(hidden_code, player.formatted_guess)
    assert game.match?
  end

end
