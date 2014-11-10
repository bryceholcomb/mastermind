gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require_relative '../lib/validator'

class ValidatorTest < Minitest::Test

  def test_a_guess_is_too_short_when_less_than_four_letters
    guess = %w(R R R)
    possible_colors = %w(R G B Y)
    validator = Validator.new(guess, possible_colors)
    assert validator.too_short?

    guess = %w(R R R R)
    possible_colors = %w(R G B Y)
    validator = Validator.new(guess, possible_colors)
    refute validator.too_short?
  end

  def test_a_guess_is_too_long_when_larger_than_four_letters
    guess = %w(R R R R R)
    possible_colors = %w(R G B Y)
    validator = Validator.new(guess, possible_colors)
    assert validator.too_long?

    guess = %w(R R R R)
    possible_colors = %w(R G B Y)
    validator = Validator.new(guess, possible_colors)
    refute validator.too_long?
  end

  def test_returns_true_when_guess_colors_match_possible_colors
    guess = %w(R R R R)
    possible_colors = %w(R G B Y)
    validator = Validator.new(guess, possible_colors)
    assert validator.contains_valid_colors?

    guess = %w(R G Y Y)
    assert validator.contains_valid_colors?
  end

  def test_returns_false_when_guess_colors_do_not_match_possible_colors
    guess = %w(R R A R)
    possible_colors = %w(R G B Y)
    validator = Validator.new(guess, possible_colors)
    refute validator.contains_valid_colors?

    guess = %w(R 5 R R)
    refute validator.contains_valid_colors?
  end

end
