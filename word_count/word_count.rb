class Phrase
  attr_reader :word_count

  def initialize(text)
    @word_count = text.downcase.scan(/[a-z0-9']+/)
                  .map { |word| word.gsub((/^'|'$/), '') }
                  .each_with_object(Hash.new(0)) { |word, hash| hash[word] += 1 }
  end
end
