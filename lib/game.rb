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
    @code            = HiddenCode.new
    @hidden_code     = @code.reveal
    @timer           = Timer.new
    @printer         = Printer.new($stdout)
    @instream        = instream
    @outstream       = outstream
    @possible_colors = @code.possible_colors
  end

  def play
    puts @printer.guess_instructions
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
    puts @printer.feedback(player.guess, hidden_code, player.formatted_guess, player.guesses)
  end


  def validate_guess(player_guess, guess_chars, possible_colors)
    case
    when ValidateGuess.too_short?(player_guess) then puts @printer.too_short_message
    when ValidateGuess.too_long?(player_guess) then puts @printer.too_long_message
    when ValidateGuess.contains_invalid_characters?(guess_chars, possible_colors)
      puts @printer.not_a_valid_guess
    else feedback
    end
  end

  def codes_match?
    CompareCodes.match?(hidden_code, player.formatted_guess)
  end

  def exit?
    player.guess == "quit" || player.guess == "q"
  end

  def check_history?
    player.guess == "history" || player.guess == "h"
  end
end
