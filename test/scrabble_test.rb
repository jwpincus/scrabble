gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_with_multipliers
    assert_equal 9, Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_it_can_score_with_word_multipliers
    assert_equal 18, Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_it_give_seven_letter_bonues
    assert_equal 58, Scrabble.new.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end

  def test_high_scoring_word
    assert_equal "home", Scrabble.new.highest_scoring_word(['home', 'word', 'hello', 'sound'])
  end

  def test_high_scoring_word_that_is_same_score
    assert_equal "word", Scrabble.new.highest_scoring_word(['hello', 'word', 'sound'])
  end

  def test_it_gives_credit_for_all_7
    assert_equal "silence", Scrabble.new.highest_scoring_word(['home', 'word', 'silence'])
  end

  def test_it_returns_first_equal_word
    assert_equal "ward", Scrabble.new.highest_scoring_word(['hi', 'ward', 'word', ])
  end
end
