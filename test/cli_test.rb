#change FILE_PATH
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cli'

class CliTest < Minitest::Test

  def test_when_player_chooses_i_the_instructions_are_printed

  end

  def test_when_player_chooses_q_the_game_ends

  end
  
end
