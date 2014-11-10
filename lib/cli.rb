require_relative './game'
require_relative './player'
require_relative './printer'

class CLI
  attr_reader :instream, :outstream, :command

  def initialize(instream, outstream)
    @instream = instream
    @outstream = outstream
    @command = ""
  end

  game = Game.new #this needs to happen in the play method
  player = Player.new


  def start_game(instream, outstream)
    outstream.puts Printer.welcome_message
    until finished?
      outstream.puts Printer.command_prompt
      @command = instream.gets.strip.downcase
      process_command
    end
  end

  def process_command
    case
    when play?
      game = Game.new($stdin, $stdout)
      game.play
    when instructions?
      outstream.puts Printer.instructions
    when finished?
      outstream.puts Printer.exit_message
    else
      puts Printer.not_a_valid_command
    end
  end

end
