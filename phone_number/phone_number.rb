class PhoneNumber
  attr_reader :digits

  def initialize(str)
    @digits = str.gsub(/\W/, "")
  end

  def no_letters?
    @digits.length == @digits.to_i.to_s.length
  end

  def number
    if no_letters? && @digits.length == 11 && @digits[0] == "1"
      @digits.sub('1', "")
    elsif no_letters? && @digits.length == 10
      @digits
    else
      '0000000000'
    end
  end 

  def area_code
    number.slice(0, 3)
  end

  def to_s
    "(#{area_code}) #{number.slice(3, 3)}-#{number.slice(6, 4)}"
  end

end