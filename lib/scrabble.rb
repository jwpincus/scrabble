require 'pry-state'

class Scrabble

  def score(word)
    word.upcase.chars.map do |letter|
      point_values[letter]
    end.reduce(:+)
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def score_with_multipliers(word, letter_multiplier = Array.new(word.length, 1), word_multiplier = 1)
    letter_score = word.split("").map do |letter|
      point_values[letter.upcase]
    end
    total_score = []
    letter_score.each_with_index do |score, idx|
      total_score << (score * letter_multiplier[idx])
    end
    total_score << 10 if word.length == 7
    total_score = (total_score.reduce(:+) * word_multiplier)
    total_score 
  end

  def highest_scoring_word(words)
    scored_words = words.map do |word|
      [score_with_multipliers(word), word]
    end
    sorted_scores = scored_words.sort_by do |word|
      word[0]
    end
    
    if sorted_scores[-2][0] == sorted_scores.last[0]
      sorted_scores[-2][1].length > sorted_scores.last[1].length ? sorted_scores.last[1] : sorted_scores[-2][1]
    else 
      sorted_scores.last[1]
    end
  end
end
