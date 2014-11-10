gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require_relative '../lib/code_comparer'

class CodeComparerTest < Minitest::Test

  def test_compares_colors_in_each_code_returns_4
    hidden_code = %w(R R G G)
    guess = %w(G G R R)
    comparer = CodeComparer.new(hidden_code, guess)
    assert_equal 4, comparer.correct_colors
  end

  def test_compares_colors_in_each_code_returns_3
    hidden_code = %w(R R R Y)
    guess = %w(Y R R G)
    comparer = CodeComparer.new(hidden_code, guess)
    assert_equal 3, comparer.correct_colors
  end

  def test_compares_colors_in_each_code_further
    hidden_code = %w(G Y B R)
    guess = %w(Y B R R)
    comparer = CodeComparer.new(hidden_code, guess)
    assert_equal 3, comparer.correct_colors
  end

  def test_compares_positions_in_each_code
    hidden_code = %w(R R R R)
    guess = %w(R G R G)
    comparer = CodeComparer.new(hidden_code, guess)
    assert_equal 2, comparer.correct_positions
  end

  def test_codes_are_equal?
    hidden_code = %w(R R R R)
    guess = %w(R R R R)
    comparer = CodeComparer.new(hidden_code, guess)
    assert true, comparer.match?
  end

  def test_comparison_methods_work_together
    hidden_code = %w(R G G Y)
    guess = %w(R Y G Y)
    comparer = CodeComparer.new(hidden_code, guess)
    assert_equal 3, comparer.correct_colors
    assert_equal 3, comparer.correct_positions
  end

end
