class RunLengthEncoding
  def self.encode(input)
    input.gsub(/((.)\2*)/) do |group|
      group.size == 1 ? group : "#{group.size}#{group[0]}"
    end
  end

  def self.decode(input)
    input.gsub(/\d+.|./) do |group|
      group.size == 1 ? group : group[-1] * group.to_i
    end
  end
end
