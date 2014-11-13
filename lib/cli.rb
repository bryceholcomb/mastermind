require_relative './game'
require_relative './printer'

class CLI
  attr_reader :instream, :outstream, :command

  def initialize(instream, outstream)
    @instream   = instream
    @outstream  = outstream
    @printer    = Printer.new($stdout)
    @command    = ""
  end

  def start_game
    puts @printer.welcome_message
    until finished?
      puts @printer.command_options
      @command = @instream.gets.strip.downcase
      process_command
    end
  end

  def process_command
    case
    when play?
      game = Game.new($stdin, $stdout)
      game.enter_game_flow
    when instructions?  then puts @printer.instructions
    when finished?      then puts @printer.exit_cli_message
    else puts @printer.not_a_valid_command
    end
  end

  def play?
    command == "play" || command == "p"
  end

  def instructions?
    command == "instructions" || command == "i"
  end

  def finished?
    command == "quit" || command == "q"
  end
end
