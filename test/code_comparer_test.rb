gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require_relative '../lib/code_comparer'

class CodeComparerTest < Minitest::Test

  def test_correct_colors_equals_4_with_4_correct_elements
    hidden_code = %w(R R G G)
    guess = %w(G G R R)
    assert_equal 4, CodeComparer.correct_colors(hidden_code, guess)
  end

  def test_correct_colors_equals_3_with_3_correct_elements
    hidden_code = %w(R R R Y)
    guess = %w(Y R R G)
    assert_equal 3, CodeComparer.correct_colors(hidden_code, guess)
  end

  def test_correct_colors_equals_2_with_2_correct_elements
    hidden_code = %w(R R G G)
    guess = %w(G Y B R)
    assert_equal 2, CodeComparer.correct_colors(hidden_code, guess)
  end

  def test_correct_colors_equals_1_with_1_correct_elements
    hidden_code = %w(R R R R)
    guess = %w(Y B R G)
    assert_equal 1, CodeComparer.correct_colors(hidden_code, guess)
  end

  def test_correct_colors_equals_0_with_0_correct_elements
    hidden_code = %w(R R R R)
    guess = %w(B B B B)
    assert_equal 0, CodeComparer.correct_colors(hidden_code, guess)
  end

  def test_correct_positions_returns_4_with_4_in_correct_position
    hidden_code = %w(R R R R)
    guess = %w(R R R R)
    assert_equal 4, CodeComparer.correct_positions(hidden_code, guess)
  end

  def test_correct_positions_returns_3_with_3_in_correct_position
    hidden_code = %w(R R R R)
    guess = %w(R R G R)
    assert_equal 3, CodeComparer.correct_positions(hidden_code, guess)
  end

  def test_correct_positions_returns_2_with_2_in_correct_position
    hidden_code = %w(R Y R B)
    guess = %w(R G R Y)
    assert_equal 2, CodeComparer.correct_positions(hidden_code, guess)
  end

  def test_correct_positions_returns_1_with_1_in_correct_position
    hidden_code = %w(R R R R)
    guess = %w(R G Y B)
    assert_equal 1, CodeComparer.correct_positions(hidden_code, guess)
  end

  def test_correct_positions_returns_0_with_0_in_correct_position
    hidden_code = %w(R R R R)
    guess = %w(B B B B)
    assert_equal 0, CodeComparer.correct_positions(hidden_code, guess)
  end

  def test_codes_are_equal?
    hidden_code = %w(R R R R)
    guess = %w(R R R R)
    assert true, CodeComparer.match?(hidden_code, guess)
  end

  def test_comparison_methods_work_together
    hidden_code = %w(R G G Y)
    guess = %w(R Y G Y)
    assert_equal 3, CodeComparer.correct_colors(hidden_code, guess)
    assert_equal 3, CodeComparer.correct_positions(hidden_code, guess)
  end

end
