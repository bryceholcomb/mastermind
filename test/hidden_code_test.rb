gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require_relative '../lib/hidden_code'

class HiddenCodeTest < Minitest::Test

  def test_creates_a_four_letter_code_by_default
    hidden_code = HiddenCode.new
    assert_equal 4, hidden_code.reveal.size
  end

  def test_creates_a_six_letter_code
    hidden_code = HiddenCode.new(6, "RGBYP")
    assert_equal 6, hidden_code.reveal.size
  end

  def test_creates_an_eight_letter_code
    hidden_code = HiddenCode.new(8, "RGBYPO")
    assert_equal 8, hidden_code.reveal.size
  end

end
