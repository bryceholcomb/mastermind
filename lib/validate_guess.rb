module ValidateGuess
  def self.too_short?(guess, hidden_code_size)
    guess.length < hidden_code_size
  end

  def self.too_long?(guess, hidden_code_size)
    guess.length > hidden_code_size
  end

  def self.contains_invalid_characters?(formatted_guess, possible_colors)
    invalid = formatted_guess - possible_colors
    invalid.count != 0
  end
end
