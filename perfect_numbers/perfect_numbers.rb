module PerfectNumber
  def self.classify(number)
    raise RuntimeError unless number > 0 && number.to_i == number

    sum = aliquot_sum(number)
    if sum == number
      "perfect"
    elsif sum < number
      "deficient"
    else
      "abundant"
    end
  end

  def self.aliquot_sum(number)
    (1..number / 2).each_with_object([0]) do |divisor, factors|
      factors << divisor if number % divisor == 0
    end.reduce(:+)
  end
end
