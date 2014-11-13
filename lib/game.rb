require_relative './code_breaker'
require_relative './printer'
require_relative './timer'
require_relative './validate_guess'
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

  def play
    puts @printer.choose_difficulty
    player.choose_difficulty(instream)
    process_difficulty
    until codes_match? || exit?
      player.make_guess(instream)
      process_guess
    end
  end

  def process_guess
    case
    when exit? then puts @printer.exit_game_message
    when codes_match? then you_win
    when check_history? then puts player.guesses
    else validate_guess(player.guess, player.formatted_guess, @possible_colors)
    end
  end

  def you_win
    @timer.calculate_time_elapsed
    puts @printer.print_stats(hidden_code, player.guesses, @timer)
  end

  def feedback
    player.add_guess
    puts @printer.feedback(player.guess, hidden_code.reveal, player.formatted_guess, player.guesses)
  end


  def validate_guess(player_guess, guess_chars, possible_colors)
    case
    when ValidateGuess.too_short?(player_guess, @hidden_code.size) then puts @printer.too_short_message
    when ValidateGuess.too_long?(player_guess, @hidden_code.size) then puts @printer.too_long_message
    when ValidateGuess.contains_invalid_characters?(guess_chars, @hidden_code.possible_colors)
      puts @printer.not_a_valid_guess
    else feedback
    end
  end

  def process_difficulty
    case player.difficulty
    when "b" then beginner_game
    when "i" then intermediate_game
    when "a" then advanced_game
    else puts @printer.choose_difficulty
    end
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

  def codes_match?
    CompareCodes.match?(hidden_code.reveal, player.formatted_guess)
  end

  def exit?
    player.guess == "quit" || player.guess == "q"
  end

  def check_history?
    player.guess == "history" || player.guess == "h"
  end

end
