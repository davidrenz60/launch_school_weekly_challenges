class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def to(max_value)
    @multiples.each_with_object([0]) do |multiple, result|
      (1...max_value).each { |num| result << num if num % multiple == 0 }
    end.uniq.reduce(:+)
  end

  def self.to(max_value)
    SumOfMultiples.new(3, 5).to(max_value)
  end
end
