class Integer
  def to_roman
    first, second, third, fourth = digits
    thousands(fourth) + hundreds(third) + tens(second) + ones(first)
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

  def digits
    to_s.chars.map(&:to_i).reverse
  end

  def ones(digit)
    digit_to_symbol(digit, %w(I V X))
  end

  def tens(digit)
    digit_to_symbol(digit, %w(X L C))
  end

  def hundreds(digit)
    digit_to_symbol(digit, %w(C D M))
  end

  def thousands(digit)
    digit_to_symbol(digit, %w(M))
  end
end
