class Octal
  def initialize(str)
    @octal = str
  end

  def to_decimal
    return 0 unless valid_octal?
    numbers = @octal.reverse.chars.map(&:to_i)
    numbers.each_with_index.map {|num, idx| (8**idx) * num }.reduce(:+)
  end

  private

  def valid_octal?
    @octal.match(/[^0-7]/).nil?
  end
end