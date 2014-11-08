require_relative './player'

class Game
  attr_reader :hidden_code

  def create_hidden_code
    @hidden_code = 'rrgg'
    puts guess_instructions
    @hidden_code
  end

  def compare
    #compare player's sequence with code
  end

  def play
    #loop through
  end

  def feedback
    "'RRGG' has 3 of the correct elements with 2 in the correct positions\nYou've taken 1 guess"
  end

  def print_stats
    "Congratulations! You guessed the sequence #{@hidden_code.upcase} in #{player.guesses} guess(es)\nDo you want to (p)lay again or (q)uit?"
  end


end

if __FILE__ == $0
  mastermind = Game.new
  puts Game.guess_instructions
end
