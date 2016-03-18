class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    range = (2..@limit).to_a
    2.upto(range[-1]) do |divisor|
      range.each { |number| range.delete(number) if number != divisor && number % divisor == 0 }
    end
    range
  end
end