require 'test/unit'
require './wordplay'

# Unit testing class for the WordPlay library
class TestWordPlay < Test::Unit::TestCase
  
  # Test that multiple sentence blocks are split into individual words correctly
  def test_sequences
    assert_equal(['a', 'b', 'c', 'c d', 'e f g'], 'a. b. c? c d! e f g.'.sentences)
    
    test_text = %q{Hello. This is a test
      of sentence separation. This is the end of the test.}
    assert_equal('This is the end of the test', test_text.sentences[2])
  end
  
  # Tests that sentences of words are split up into distinct words correctly
  def test_words
    assert_equal(%w{this is a test}, "this is a test".words)
    assert_equal(%w{these are mostly words}, "these are, mostly, words.".words)
  end
  
  # Test that the correct sentence is chosen, given the input
  def test_sentence_choice
    assert_equal('This is a great test', 
                 WordPlay.best_sentence(['This is a test',
                                         'This is a great test'],
                                         %w{test great this}))
    assert_equal('This is a great test', WordPlay.best_sentence(['This is a great test'],
                                                                %w{still the best}))
  end
  
  # Test that basic pronouns are swtiched by switch_pronouns
  def test_pronouns
    assert_equal('I am a robot', WordPlay.switch_pronouns('You are a robot'))
    assert_equal('You are a person', WordPlay.switch_pronouns('I am a person'))
    assert_equal('I love you', WordPlay.switch_pronouns('You love me'))
    assert_equal('You suck balls', WordPlay.switch_pronouns('I suck balls'))
    assert_equal('I hate you!?', WordPlay.switch_pronouns('You hate me!?'))
  end
  
  # Test more complex sentence switches using switch_pronouns
  def test_complex_pronouns
    assert_equal('yes, I rule', WordPlay.switch_pronouns('yes, you rule'))
    assert_equal('Am I stupid?', WordPlay.switch_pronouns('are u stupid?'))
    assert_equal('why do i cry?', WordPlay.switch_pronouns('why do you cry?'))
  end
  
end