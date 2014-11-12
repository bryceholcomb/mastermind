module CompareCodes
  def self.match?(hidden_code, guess)
    hidden_code == guess
  end

  def self.correct_colors(hidden_code, guess)
   code = hidden_code.dup
   correct_colors = 0
     guess.each do |color|
       if code.include?(color)
         correct_colors += 1
         code.slice!(code.index(color))
       end
     end
     correct_colors
  end

  def self.correct_positions(hidden_code, guess)
    correct_positions = (0..(hidden_code.size - 1)).count { |i| guess[i] == hidden_code[i] }
  end
end
