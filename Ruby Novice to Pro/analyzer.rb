lines = File.readlines(ARGV[0]);
line_count = lines.size
text = lines.join

# Count the chars
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/, '').length

# Count the words, sentences, and paragraphs
word_count = text.split.length
paragraph_count = text.split(/\n\n/).length
sentence_count = text.split(/\.|\?|!/).length

# Percentage of good words
stopwords = %w{the a by on for of are with just but and to the my I has some in}
all_words = text.scan(/\w+/)
good_words = all_words.select { |word| !stopwords.include?(word) }
good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i

# Summarize the text
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentences.length }
one_third = sentences.length / 3.0
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |select| sentences=~ /is|are/}


puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospaces} characters (excluding spaces)"
puts "#{word_count} words"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count} sentences"
puts "#{sentence_count / paragraph_count} sentences per paragraph"
puts "#{word_count / sentence_count} words per sentence"
puts "#{good_percentage}% of words are non-fluff words"
puts "Summary:\n\n" + ideal_sentences.join('.');
puts "--End of analysis"