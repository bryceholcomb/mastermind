class HiddenCode

  def initialize(size = 4)
    possible_colors = %w( R G B Y )                                               # => ["R", "G", "B", "Y"]
    @hidden_code = (0...size).map{ possible_colors[rand(possible_colors.size)] }  # => ["R", "R", "R", "Y"]
  end

  def reveal
    @hidden_code  # => ["R", "R", "R", "Y"]
  end
end

if __FILE__ == $0               # => true
  hidden_code = HiddenCode.new  # => #<HiddenCode:0x007fd2fa834ff8 @hidden_code=["R", "R", "R", "Y"]>
  hidden_code.reveal            # => ["R", "R", "R", "Y"]
end                             # => ["R", "R", "R", "Y"]
