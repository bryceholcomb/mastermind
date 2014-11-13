require_relative './validate_guess'

class GuessProcessor
  def process_guess
    case
    when play_exit? then puts @printer.exit_game_message
    when codes_match? then you_win
    when check_history? then puts player.guesses
    else validate_guess(player.guess, player.formatted_guess, @possible_colors)
    end
  end

  def validate_guess(player_guess, guess_chars, possible_colors)
    case
    when ValidateGuess.too_short?(player_guess, @hidden_code.size) then puts @printer.too_short_message
    when ValidateGuess.too_long?(player_guess, @hidden_code.size) then puts @printer.too_long_message
    when ValidateGuess.contains_invalid_characters?(guess_chars, @hidden_code.possible_colors)
      puts @printer.not_a_valid_guess
    else feedback
    end
  end

  def feedback
    player.add_guess
    puts @printer.feedback(player.guess, hidden_code.reveal, player.formatted_guess, player.guesses)
  end

  def you_win
    @timer.calculate_time_elapsed
    puts @printer.print_stats(hidden_code, player.guesses, @timer)
  end

  def codes_match?
    CompareCodes.match?(hidden_code.reveal, player.formatted_guess)
  end

  def play_exit?
    player.guess == "quit" || player.guess == "q"
  end

  def check_history?
    player.guess == "history" || player.guess == "h"
  end

end
