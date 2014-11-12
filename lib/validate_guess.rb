module ValidateGuess
  def self.too_short?(guess)
    guess.length < 4
  end

  def self.too_long?(guess)
    guess.length > 4
  end

  def self.contains_invalid_characters?(formatted_guess, possible_colors)
    invalid = formatted_guess - possible_colors
    invalid.count != 0
  end
end
