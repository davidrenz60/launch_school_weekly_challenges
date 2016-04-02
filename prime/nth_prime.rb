class Prime
  def self.nth(num)
    fail ArgumentError unless num > 0
    @primes = [2]
    current_num = 3
    while @primes.length < num
      @primes << current_num if is_prime?(current_num)
      current_num += 2
    end
    @primes.last
  end

  def self.is_prime?(num)
    @primes.each do |prime|
      return false if num % prime == 0
      break true if prime > Math.sqrt(num)
    end
  end
end