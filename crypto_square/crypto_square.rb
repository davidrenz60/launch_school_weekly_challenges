class Crypto
  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    @text.downcase.scan(/\w/).join
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/.{#{size}}|.+/)
  end

  def ciphertext
    encode.join
  end

  def normalize_ciphertext
    encode.join(' ')
  end

  def encode
    first_row, *remaining_rows = plaintext_segments.map(&:chars)
    first_row.zip(*remaining_rows).map(&:join)
  end
end
