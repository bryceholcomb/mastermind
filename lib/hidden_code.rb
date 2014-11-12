class HiddenCode
  def initialize(size = 4, possible_colors = "rgby")
    @possible_colors = possible_colors.strip.upcase.chars
    @hidden_code = (0...size).map{ @possible_colors[rand(@possible_colors.size)] }
  end

  def reveal
    @hidden_code
  end
end
