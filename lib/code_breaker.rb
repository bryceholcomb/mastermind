class CodeBreaker
  attr_reader :guess, :guesses, :formatted_guess, :difficulty

  def initialize
    @guesses = []
    @guess = ""
  end

  def make_guess(instream)
    @guess = instream.gets.downcase.strip
    @formatted_guess = @guess.upcase.chars
  end

  def add_guess
    guesses << guess.upcase
  end

  def choose_difficulty(instream)
    @difficulty = instream.gets.downcase.strip
  end
end
