class Luhn
  def initialize(num)
    @num = num
  end

  def addends
    digits = @num.to_s.reverse.chars.map(&:to_i)
    digits.each_with_index.map { |digit, idx| idx.odd? ? convert(digit) : digit }.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num)
    num *= 10
    luhn = Luhn.new(num)
    check_digit = (10 - luhn.checksum % 10) % 10
    num + check_digit
  end

  private

  def convert(num)
    num *= 2
    num -= 9 if num > 9
    num
  end
end
