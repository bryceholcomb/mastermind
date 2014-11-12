class CodeBreaker
  attr_reader :guess, :guesses, :formatted_guess

  def initialize
    @guesses = []
    @guess = ""
  end

  def make_guess(instream)
    @guess = instream.gets.strip
    @formatted_guess = @guess.upcase.chars
  end

  def add_guess
    guesses << guess.upcase
  end
end
