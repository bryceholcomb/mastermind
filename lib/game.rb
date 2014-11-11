require_relative './printer'
require_relative './timer'
require_relative './code_comparer'
require_relative './hidden_code'

class Game
  #use stream from earlier lesson to change where the input is coming from
  attr_reader :instream, :outstream, :guesses, :guess, :formatted_guess

  def initialize(instream, outstream, possible_colors = %w(R G B Y))
    @timer           = Timer.new
    @printer         = Printer.new($stdout)
    @instream        = instream
    @outstream       = outstream
    @guesses         = []
    @hidden_code     = HiddenCode.new.reveal
    @possible_colors = possible_colors
    @guess           = ""
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
      puts "Congratulations! You guessed the sequence '#{@hidden_code.join}' in #{@guesses.count} guess(es) over #{@timer.minutes} minute(s), #{@timer.seconds} second(s).\n"
    when too_short? then puts @printer.too_short_message
    when too_long? then puts @printer.too_long_message
    when contains_invalid_colors? then puts @printer.not_a_valid_guess
    else
      @guesses << @guess
      puts "'#{@guess.upcase}' has #{CodeComparer.correct_colors(@hidden_code, @formatted_guess)} of the correct elements with #{CodeComparer.correct_positions(@hidden_code, @formatted_guess)} in the correct position\nYou've taken #{@guesses.count} guess(es). Guess again!"
    end
  end

  def take_turn
    @guess = instream.gets.strip
    @formatted_guess = @guess.upcase.chars
  end

  def match?
    CodeComparer.match?(@hidden_code, @formatted_guess)
  end

  def exit?
    guess == "quit" || guess == "q"
  end

  def too_short?
    @guess.length < 4
  end

  def too_long?
    @guess.length > 4
  end

  def contains_invalid_colors?
    invalid = @formatted_guess - @possible_colors
    invalid.count != 0
  end

end

if __FILE__ == $0
  game = Game.new($stdin, $stdout)
  game.play
end
