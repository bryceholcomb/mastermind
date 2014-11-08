module Communication
  def self.welcome_message
    "\nWelcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.instructions
    "Mastermind is a game with two players, a Codemaker and a Codebreaker. I will play the role of Codemaker and generate a random sequence of colored pins in a specific order called the code. The pins can be either Red, Green, Yellow or Blue. You, the Codebreaker, will attempt to guess my sequence by submitting your own. With each sequence you submit I will tell you the number of pins that match the correct colors, or match the correct color and position. You will continue to submit sequences based on my clues until you have guessed the correct sequence. Try to guess my sequence in the least amount of guesses. Good luck!"
  end

  def self.guess_instructions
    "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?"
  end

  def self.exit_message
    "Thanks for playing! Come back again."
  end
end
