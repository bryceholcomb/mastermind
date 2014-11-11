require_relative './game'
require_relative './printer'

class CLI
  attr_reader :instream, :outstream, :command

  def initialize(instream, outstream)
    @instream   = instream
    @outstream  = outstream
    @command    = ""
  end

  def start_game
    outstream.puts Printer.welcome_message
    until finished?
      outstream.puts Printer.command_options
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
      outstream.puts Printer.exit_cli_message
    else
      puts Printer.not_a_valid_command
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

if __FILE__ == $0
  cli = CLI.new($stdin, $stdout)
  cli.start_game
end
