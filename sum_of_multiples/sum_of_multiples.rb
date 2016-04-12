class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(max_value)
    (0...max_value).select do |multiple|
      @factors.any? { |factor| multiple % factor == 0 }
    end.reduce(:+)
  end

  def self.to(max_value)
    new(3, 5).to(max_value)
  end
end
