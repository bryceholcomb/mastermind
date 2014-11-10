class Validator

  def initialize(guess, possible_colors)
    @guess = guess
    @possible_colors = possible_colors
  end

  def too_short?
    @guess.length < 4
  end

  def too_long?
    @guess.length > 4
  end

  def contains_valid_colors?
    invalid = @guess - @possible_colors
    invalid.count == 0
  end
end
