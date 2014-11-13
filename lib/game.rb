require_relative './code_breaker'
require_relative './printer'
require_relative './timer'
require_relative './process_guess'
require_relative './compare_codes'
require_relative './hidden_code'

class Game
  attr_reader :instream, :outstream, :player, :hidden_code

  def initialize(instream, outstream)
    @player          = CodeBreaker.new
    @timer           = Timer.new
    @printer         = Printer.new($stdout)
    @instream        = instream
    @outstream       = outstream
  end

  def enter_game_flow
    until valid_difficulty? || setup_exit?
      puts @printer.choose_difficulty
      player.choose_difficulty(instream)
      if valid_difficulty?
        process_difficulty
        play
      end
    end
  end

  def play
    until GuessProcessor.codes_match? || GuessProcessor.play_exit?
      player.make_guess(instream)
      GuessProcessor.process_guess
    end
  end

  def process_difficulty
    case player.difficulty
    when "b" then beginner_game
    when "i" then intermediate_game
    when "a" then advanced_game
    end
  end

  def valid_difficulty?
    player.difficulty == "b" ||
    player.difficulty == "i" ||
    player.difficulty == "a"
  end

  def beginner_game
    @hidden_code = HiddenCode.new(4, "rgby")
    puts @printer.beginner_sequence
  end

  def intermediate_game
    @hidden_code = HiddenCode.new(6, "rgbyp")
    puts @printer.intermediate_sequence
  end

  def advanced_game
    @hidden_code = HiddenCode.new(8, "rgbypo")
    puts @printer.advanced_sequence
  end

  def setup_exit?
    player.difficulty == "quit" || player.difficulty == "q"
  end

end
