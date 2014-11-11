#change this to class and instantiate with outstream

module Printer
  def self.welcome_message
    "\nWelcome to MASTERMIND\n"
  end

  def self.command_options
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n" + Printer.command_prompt
  end

  def self.command_prompt
    "Enter your command:\n"
  end

  def self.instructions
    "Mastermind is a game with two players, a Codemaker and a Codebreaker. I will play the role of Codemaker and generate a random sequence of colored pins in a specific order called the code. The pins can be either Red, Green, Yellow or Blue. You, the Codebreaker, will attempt to guess my sequence by submitting your own. With each sequence you submit I will tell you the number of pins that match the correct colors, or match the correct color and position. You will continue to submit sequences based on my clues until you have guessed the correct sequence. Try to guess my sequence in the least amount of guesses. Good luck!"
  end

  def self.guess_instructions
    "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\nWhat's your guess?\n"
  end

  def self.exit_game_message
    "Thanks for playing! Come back again."
  end

  def self.exit_cli_message
    "See you next time!"
  end

  def self.feedback
    "'#{@guess}' has #{CodeComparer.correct_colors(@hidden_code, @formatted_guess)} of the correct elements with #{CodeComparer.correct_positions(@hidden_code, @formatted_guess)} in the correct position\nYou've taken #{@guesses.count} guess(es).\n Guess again!\n"
  end

  def self.print_stats
    "Congratulations! You guessed the sequence #{@hidden_code} in #{@guesses.count} guess(es)\n" + Printer.command_options
  end

  def self.too_short_message
    "That sequence is too short\n" + Printer.correct_sequence_message + Printer.whats_your_guess
  end

  def self.too_long_message
    "That sequence is too long\n" + Printer.correct_sequence_message + Printer.whats_your_guess
  end

  def self.not_a_valid_command
    "This is not a valid command\n"
  end

  def self.not_a_valid_guess
    "This is not a valid sequence\n" + Printer.correct_sequence_message + Printer.whats_your_guess
  end

  def self.correct_sequence_message
    "A correct sequence must be four characters long and only contain an R, G, B or Y\n"
  end

  def self.whats_your_guess
    "What's your guess?"
  end
end
