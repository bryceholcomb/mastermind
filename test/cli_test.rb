#change FILE_PATH
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cli'

class CliTest < Minitest::Test

  def test_when_command_is_q_the_REPL_exits
    cli = CLI.new(StringIO.new('q'), $stdout)
    cli.start_game
    assert_equal 'q', cli.command
    assert cli.finished?
  end

  def test_when_command_is_p_the_game_begins
    cli = CLI.new(StringIO.new('p'), $stdout)
    cli.start_game
    assert_equal 'p', cli.command
    assert cli.play?
  end

  def test_when_command_is_i_the_instructions_are_printed
    cli = CLI.new(StringIO.new('i'), $stdout)
    cli.start_game
    assert_equal 'i', cli.command
    assert cli.instructions?
  end

end
