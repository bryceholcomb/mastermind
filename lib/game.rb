require_relative './player'
require_relative './printer'
require_relative './code_comparer'
require_relative './hidden_code_generator'

class Game
  #use stream from earlier lesson to change where the input is coming from
  def initialize(instream, outstream)
    @instream = instream
    @outstream = outstream
  end

  def play
    hidden_code = HiddenCode.new
    puts Printer.guess_instructions
    guess = instream.gets.chomp
    player.take_turn(guess)
    loop do
      if player.guess != @hidden_code
        guess = instream.gets.chomp
        player.take_turn(guess)
        compare_codes(player)
        outstream.puts feedback(player)
      else
        outstream.puts print_stats
        break
      end
    end
  end




end

if __FILE__ == $0
  mastermind = Game.new
end
