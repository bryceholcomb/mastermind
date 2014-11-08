require_relative './game'
require_relative './player'
require_relative './communication'

mastermind = Game.new
player = Player.new



loop do
  puts Communication.welcome_message
  answer = gets.chomp.downcase
  case answer
  when 'play', 'p'
    mastermind.play
  when 'instructions', 'i'
    puts Communication.instructions
  when 'quit', 'q'
    puts Communication.exit_message
    break
  else
    puts "Please enter '(p)lay', '(i)nstructions' or '(q)uit'"
  end
end
