class String
  def sentences
    gsub(/\n|\r/, ' ').split(/[\.!?]\s*/)
  end
  def words
    scan(/\w[\w\'\-]*/)
  end
end

class WordPlay
  
  def self.switch_pronouns(text)
    text.gsub(/\b(I am|You are|I|You|Me|Your|My|u|)\b/i) do |pronoun|
      case pronoun.downcase
        when 'i'
          'you'
        when 'you'
          'me'
        when 'me'
          'you'
        when 'i am'
          'you are'
        when 'you are'
          'I am'
        when 'your'
          'my'
        when 'my'
          'your'
        when 'u'
          'me'
      end
    end.sub(/^me\b/i, 'I')
  end
  
  def self.best_sentence(sentences, desired_words)
    ranked_sentences = sentences.sort_by do |s|
      s.words.length - (s.downcase.words - desired_words).length
    end
    ranked_sentences.last
  end
end

# while input = gets
#   puts '>> ' + WordPlay.switch_pronouns(input).chomp + "?"
# end