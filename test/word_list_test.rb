gem 'minitest'
require_relative '../lib/word_list'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class WordListTest < Minitest::Test
  def test_it_instantiates
    assert WordList.new
  end

  def test_it_counts
    list = WordList.new
    assert_equal 0, list.count
  end

  def test_it_total_scores
    list = WordList.new
    assert_equal 0, list.total_score
  end

  def test_it_can_add_words
    list = WordList.new
    list.add("hello")
    assert_equal 1, list.count
    assert_equal 8, list.head.score
    assert_equal 8, list.total_score
    list.add("hi")
    assert_equal 2, list.count
    assert_equal 5, list.head.score
    assert_equal 13, list.total_score
    list.add("snacker")
    assert_equal 3, list.count
    assert_equal 13, list.head.score
    assert_equal 26, list.total_score
  end
end
