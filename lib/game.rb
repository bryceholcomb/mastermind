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
    until match? || exit?
      player.make_guess(instream)
      process_guess
    end
  end

  def process_guess
    case
    when exit? then puts @printer.exit_game_message
    when match?
      @timer.calculate_time_elapsed
      puts @printer.print_stats(hidden_code, player.guesses, @timer)
    when ValidateGuess.too_short?(player.guess) then puts @printer.too_short_message
    when ValidateGuess.too_long?(player.guess) then puts @printer.too_long_message
    when ValidateGuess.contains_invalid_characters?(player.formatted_guess, @possible_colors) then puts @printer.not_a_valid_guess
    else
      player.add_guess
      puts @printer.feedback(player.guess, hidden_code, player.formatted_guess, player.guesses)
    end
  end

  def match?
    CompareCodes.match?(hidden_code, player.formatted_guess)
  end

  def exit?
    player.guess == "quit" || player.guess == "q"
  end
end
