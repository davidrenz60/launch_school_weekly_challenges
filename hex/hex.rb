class Hex
  VALUES = {"a" => 10, "b" => 11, "c" => 12, "d" => 13, "e" => 14, "f" => 15, 
            "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, 
            "6" => 6, "7" => 7, "8" => 8, "9" => 9, "0" => 0 }
  
  def initialize(str)
    @hex = str
  end

  def to_decimal
    return 0 if invalid_hex?
    numbers = @hex.reverse.chars.map do |digit|
    numbers.each_with_index.map {|num, idx| 16**idx * num }.inject(:+)
  end
  
  private

  def invalid_hex?
    @hex.match(/[^0-9a-fA-F]/)
  end
end
