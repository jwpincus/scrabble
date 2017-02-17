require './lib/node'
require './lib/scrabble'
class WordList
  attr_reader :count, :total_score, :head
  def initialize
    @head = nil
    @count = 0
    @total_score = 0
  end
  

  def add(word)
    @count += 1
    @total_score += Scrabble.new.score(word)
    @head = Node.new(word,nil)
    current = @head
    while current.next_word != nil
      current = current.next_word
    end
    current.next_word = Node.new(word, nil)
  end
end
