class Trinary
  def initialize(str)
    @trinary = str
  end

  def to_decimal
    return 0 if invalid_trinary?
    numbers = @trinary.reverse.chars.map(&:to_i)
    numbers.each_with_index.map { |num, idx| 3**idx * num }.inject(:+)
  end

  private

  def invalid_trinary?
    @trinary.match(/[^0-2]/)
  end
end

dave = "str"

