class TopScores

  top_scores = Array.new
  CSV.foreach('top_scores.csv') do |row|
    top_scores << row
  end

  def write_to_csv
    CSV.open(to_file= 'top_scores.csv', "w") do |csv|
      csv << ["Name", "Sequence", "Guesses", "Time"]
    end
  end

  def append_player_score(player_name, correct_sequence, guesses, elapsed_time)
    CSV.open(to_file= 'top_scores.csv', "a") do |csv|
      csv << [player_name, correct_sequence, guesses, elapsed_time]
    end
  end

end
