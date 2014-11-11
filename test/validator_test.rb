gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/validator'

class ValidatorTest < Minitest::Test
  def test_it_exists
    assert Validator
  end

  def test_guess_is_too_short
    guess = "R"
    assert Validator.too_short?(guess)

    guess = "RRRR"
    refute Validator.too_short?(guess)
  end

  def test_guess_is_too_long
    guess = "RRRRRRR"
    assert Validator.too_long?(guess)

    guess = "RRRR"
    refute Validator.too_long?(guess)
  end

  def test_guess_contains_invalid_characters
    formatted_guess = %w(W 5 V Q)
    possible_colors = %w(R G B Y)
    assert Validator.contains_invalid_characters?(formatted_guess, possible_colors)

    formatted_guess = %w(R R R R)
    possible_colors = %w(R G B Y)
    refute Validator.contains_invalid_characters?(formatted_guess, possible_colors)   
  end
end
