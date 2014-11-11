class HiddenCode

  def initialize(size = 4, possible_colors = "rgby")
    @possible_colors = possible_colors.upcase.chars                                 # => ["R", "G", "B", "Y"]
    @hidden_code = (0...size).map{ @possible_colors[rand(@possible_colors.size)] }  # => ["Y", "G", "B", "B"]
  end

  def reveal
    @hidden_code  # => ["Y", "G", "B", "B"]
  end
end

if __FILE__ == $0               # => true
  hidden_code = HiddenCode.new  # => #<HiddenCode:0x007fbab39891b0 @possible_colors=["R", "G", "B", "Y"], @hidden_code=["Y", "G", "B", "B"]>
  hidden_code.reveal            # => ["Y", "G", "B", "B"]
end                             # => ["Y", "G", "B", "B"]
