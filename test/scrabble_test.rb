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
end
