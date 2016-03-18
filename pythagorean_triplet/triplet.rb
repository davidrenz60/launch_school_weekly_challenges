class Triplet
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def sum
    a + b + c
  end

  def product
    a * b * c
  end

  def pythagorean?
    a**2 + b**2 == c**2
  end

  def self.where(sum: nil, min_factor: 1, max_factor:)
    result = []
    range = (min_factor..max_factor).to_a
    combs = range.combination(3).to_a

    combs.each do |comb|
      triplet = Triplet.new(*comb)
      if triplet.pythagorean?
        result << triplet if sum.nil? || sum == triplet.sum
      end
    end
    result
  end
end
