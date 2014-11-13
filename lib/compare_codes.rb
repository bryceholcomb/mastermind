module CompareCodes
  def self.match?(hidden_code, guess)
    hidden_code == guess
  end

  def self.correct_colors(hidden_code, guess)
   code = hidden_code.dup
   correct_colors = guess.count do |color|
       if code.include?(color)
         code.slice!(code.index(color))
       end
     end
  end

  def self.correct_positions(hidden_code, guess)
    correct_positions = (0..(hidden_code.size - 1)).count { |i| guess[i] == hidden_code[i] }
  end
end
