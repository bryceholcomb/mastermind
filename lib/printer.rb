class Printer
  def initialize(outstream)
    @outstream = outstream
  end

#<<<CLI messages>>>
  def welcome_message
    "\nWelcome to MASTERMIND\n"
  end

  def command_prompt
    "Enter your command:"
  end

  def command_options
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n#{command_prompt}\n"
  end

  def instructions
    "\nMastermind is a game with two players, a Codemaker and a Codebreaker.\nI will play the role of Codemaker and generate a random sequence of colored pins in a specific order called the code.\nThe pins can be either Red, Green, Yellow or Blue. You, the Codebreaker, will attempt to guess my sequence by submitting your own.\nWith each sequence you submit I will tell you the number of pins that match the correct colors, or match the correct color and position.\nYou will continue to submit sequences based on my clues until you have guessed the correct sequence.\nTry to guess my sequence in the least amount of guesses. Good luck!\n"
  end

  def exit_cli_message
    "See you next time!"
  end

  def not_a_valid_command
    "This is not a valid command\n"
  end

#<<<Game messages>>>
  def guess_instructions
    "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\nWhat's your guess?\n"
  end

  def exit_game_message
    "Thanks for playing! Come back again."
  end

  def feedback(guess, hidden_code, formatted_guess, guesses)
    "\n'#{guess.upcase}' has #{CodeComparer.correct_colors(hidden_code, formatted_guess)} of the correct elements with #{CodeComparer.correct_positions(hidden_code, formatted_guess)} in the correct position\nYou've taken #{guesses.count} guess(es). Guess again!"
  end

  def print_stats(hidden_code, guesses, timer)
    "Congratulations! You guessed the sequence '#{hidden_code.join}' in #{guesses.count} guess(es) over #{timer.minutes} minute(s), #{timer.seconds} second(s).\n"
  end

  def too_short_message
    "That sequence is too short\n#{correct_sequence_message}#{whats_your_guess}"
  end

  def too_long_message
    "That sequence is too long\n#{correct_sequence_message}#{whats_your_guess}"
  end

  def not_a_valid_guess
    "This is not a valid sequence\n#{correct_sequence_message}#{whats_your_guess}"
  end

  def correct_sequence_message
    "A correct sequence must be four characters long and only contain an R, G, B or Y\n"
  end

  def whats_your_guess
    "What's your guess?\n"
  end
end
