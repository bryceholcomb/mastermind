require_relative './printer'
require_relative './timer'
require_relative './validator'
require_relative './code_comparer'
require_relative './hidden_code'

class Game
  attr_reader :instream, :outstream, :guesses, :guess, :formatted_guess, :hidden_code

  def initialize(instream, outstream, possible_colors = %w(R G B Y))
    @hidden_code     = HiddenCode.new.reveal
    @guess           = ""
    @timer           = Timer.new
    @printer         = Printer.new($stdout)
    @instream        = instream
    @outstream       = outstream
    @guesses         = []
    @possible_colors = possible_colors
  end

  def play
    puts @printer.guess_instructions
    until match? || exit?
      take_turn
      process_guess
    end
  end

  def process_guess
    case
    when exit? then puts @printer.exit_game_message
    when match?
      @timer.calculate_time_elapsed
      puts @printer.print_stats(hidden_code, guesses, @timer)
    when Validator.too_short?(guess) then puts @printer.too_short_message
    when Validator.too_long?(guess) then puts @printer.too_long_message
    when Validator.contains_invalid_characters?(formatted_guess, @possible_colors) then puts @printer.not_a_valid_guess
    else
      @guesses << @guess
      puts @printer.feedback(guess, hidden_code, formatted_guess, guesses)
    end
  end

  def take_turn
    @guess = instream.gets.strip
    @formatted_guess = @guess.upcase.chars
  end

  def match?
    CodeComparer.match?(hidden_code, formatted_guess)
  end

  def exit?
    guess == "quit" || guess == "q"
  end
end
