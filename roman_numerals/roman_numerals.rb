class Integer
  def to_roman
    digits.each_with_object("").with_index do |(digit, numeral), index|
      numeral.prepend(digit_to_symbol(digit, symbols[index]))
    end
  end

  private

  def digit_to_symbol(digit, symbols)
    case digit
    when (1..3) then symbols[0] * digit
    when 4 then symbols[0] + symbols[1]
    when 5 then symbols[1]
    when (6..8) then symbols[1] + (symbols[0] * (digit - 5))
    when 9 then symbols[0] + symbols[2]
    when 0, nil then ""
    end
  end

  def symbols
    [["I", "V", "X"], ["X", "L", "C"], ["C", "D", "M"], ["M"]]
  end

  def digits
    to_s.chars.map(&:to_i).reverse
  end
end
