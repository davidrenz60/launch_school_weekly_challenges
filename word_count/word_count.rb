class Phrase
  attr_reader :word_count

  def initialize(text)
    @word_count = text.scan(/[a-zA-Z0-9']+/)
                  .map { |word| word.downcase.gsub((/^'|'$/), '') }
                  .each_with_object(Hash.new(0)) { |word, hash| hash[word] += 1 }
  end
end
