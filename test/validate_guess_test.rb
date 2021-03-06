gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/validate_guess'

class ValidateGuessTest < Minitest::Test
  def test_it_exists
    assert ValidateGuess
  end

  def test_guess_is_too_short
    guess = "R"
    assert ValidateGuess.too_short?(guess)

    guess = "RRRR"
    refute ValidateGuess.too_short?(guess)
  end

  def test_guess_is_too_long
    guess = "RRRRRRR"
    assert ValidateGuess.too_long?(guess)

    guess = "RRRR"
    refute ValidateGuess.too_long?(guess)
  end

  def test_guess_contains_invalid_characters
    formatted_guess = %w(W 5 V Q)
    possible_colors = %w(R G B Y)
    assert ValidateGuess.contains_invalid_characters?(formatted_guess, possible_colors)

    formatted_guess = %w(R R R R)
    possible_colors = %w(R G B Y)
    refute ValidateGuess.contains_invalid_characters?(formatted_guess, possible_colors)
  end
end
