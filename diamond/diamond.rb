module Diamond
  def self.make_diamond(letter)
    spaced_letters = add_spaces(letter)
    rows = make_rows(spaced_letters)
    rows.pop if letter == "A"
    rows.map { |row| row.center(rows.size) + "\n" }.join
  end

  class << self
    private

    def add_spaces(input)
      ("B"..input).map.with_index do |letter, index|
        letter + " " * (2 * index + 1) + letter
      end.unshift("A")
    end

    def make_rows(letters)
      letters + letters.slice(0..letters.size - 2).reverse
    end
  end
end
