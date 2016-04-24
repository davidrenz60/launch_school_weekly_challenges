class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(words)
    words.select do |word|
      next if word.downcase == @word
      count_letters(word.downcase) == count_letters(@word)
    end
  end

  def count_letters(word)
    word.chars.each_with_object({}) do |letter, hash|
      hash[letter] = word.count(letter)
    end
  end
end
