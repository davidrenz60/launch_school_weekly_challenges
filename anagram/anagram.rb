class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    words.select { |word| anagram?(word) }
  end

  private

  def anagram?(word)
    return false if word.downcase == @word
    arrange(word) == arrange(@word)
  end

  def arrange(word)
    word.downcase.chars.sort
  end
end
