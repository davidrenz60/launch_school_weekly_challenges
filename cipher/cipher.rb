class Cipher
  LETTERS = ("a".."z").to_a

  attr_reader :key

  def initialize(key=generate_key)
    fail ArgumentError if key =~ /[0-9A-Z]|^$/
    @key = key
  end

  def encode(text)
    result = []
    text.chars.each_with_index do |letter, idx|
      shift_index = LETTERS.index(letter) + LETTERS.index(key[idx])
      shift_index -= 26 if shift_index > 25
      result << LETTERS[shift_index]
    end
    result.join
  end

  def decode(text)
    result = []
    text.chars.each_with_index do |letter, idx|
      shift_index = LETTERS.index(letter) - LETTERS.index(key[idx])
      shift_index += 26 if shift_index < 0
      result << LETTERS[shift_index]
    end
    result.join
  end

  private

  def generate_key
    random_key = ""
    100.times { random_key << LETTERS.sample }
    random_key
  end
end
