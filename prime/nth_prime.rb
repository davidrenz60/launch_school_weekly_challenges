class Prime
  def self.nth(num)
    fail ArgumentError unless num > 0
    @primes = []
    counter = 2
    while @primes.length < num
      @primes << counter if is_prime?(counter)
      counter += 1
    end
    @primes.last
  end

  def self.is_prime?(num)
    @primes.each do |prime|
      return false if num % prime == 0
      break if prime > Math.sqrt(num)
    end

    true
  end
end
