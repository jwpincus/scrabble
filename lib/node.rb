require "./lib/scrabble"
class Node
  attr_accessor :word, :next_word, :score
  def initialize(word, next_word)
    @word = word
    @count = 0
    @next_word = next_word
    @score = Scrabble.new.score(word)
  end

end