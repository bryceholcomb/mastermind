class CodeComparer

  def initialize(hidden_code, guess)
    @hidden_code = hidden_code
    @guess = guess
  end

  def match?
    @hidden_code == @guess
  end

  def correct_colors
   hidden_code = @hidden_code.dup
   @correct_colors = 0
     @guess.each do |color|
       if hidden_code.include?(color)
         @correct_colors += 1
         hidden_code.slice!(hidden_code.index(color))
       end
     end
     @correct_colors
  end

  def correct_positions
    @correct_positions = (0..(@hidden_code.size - 1)).count { |i| @guess[i] == @hidden_code[i] }
  end

end

if __FILE__ == $0
  code = %w(Y R G B)
  guess = %w(Y G G Y)
  comparer = CodeComparer.new(code, guess)
  puts comparer.correct_colors
  puts comparer.correct_positions
end
