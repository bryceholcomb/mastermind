require_relative './game'
require_relative './communication'

class Player
  attr_reader :guesses, :sequence, :sequences

  def initialize
    @guesses = 0
    @sequences = []
  end

  def valid_guess?
    #need to validate guess based on length and return message if it is too short or too long
  end

  def guess
    puts Communication.guess_instructions
    @sequence = gets
    @guesses += 1
    @sequences << @sequence.upcase
    @sequence
  end
end

if __FILE__ == $0
  player = Player.new
  player.guess
  puts player.sequence.upcase
  player.guess
  puts player.sequence.upcase
  puts player.sequences
end
