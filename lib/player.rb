require_relative './printer'

class Player
  attr_reader :guesses, :guess, :formatted_guess

  def initialize
    @guesses = []
  end

  def take_turn(guess)
    @guess = guess
    @formatted_guess = @guess.strip.upcase.chars
    @guesses << @guess
  end
end

if __FILE__ == $0
  player = Player.new
  player.take_turn('rGRb')
  puts player.guess
  player.take_turn('bbbb')
  puts "You guessed '#{player.guess}'."
  puts player.guesses
end
