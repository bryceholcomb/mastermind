gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/printer'

class PrinterTest < Minitest::Test
  def test_welcome_message
    assert_equal "\nWelcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?",
    Printer.welcome_message
  end

  def test_instructions
    assert_equal "Mastermind is a game with two players, a Codemaker and a Codebreaker. I will play the role of Codemaker and generate a random sequence of colored pins in a specific order called the code. The pins can be either Red, Green, Yellow or Blue. You, the Codebreaker, will attempt to guess my sequence by submitting your own. With each sequence you submit I will tell you the number of pins that match the correct colors, or match the correct color and position. You will continue to submit sequences based on my clues until you have guessed the correct sequence. Try to guess my sequence in the least amount of guesses. Good luck!",
    Printer.instructions
  end

  def test_exit_message
    assert_equal "Thanks for playing! Come back again.",
    Printer.exit_message
  end

  def test_guess_instructions
    assert_equal "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?",
    Printer.guess_instructions
  end
end
