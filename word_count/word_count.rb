class Phrase
  attr_reader :word_count

  def initialize(text)
    @word_count = text.downcase.scan(/\w+'?\w+|\d+/)
                  .each_with_object(Hash.new(0)) { |word, hash| hash[word] += 1 }
  end
end