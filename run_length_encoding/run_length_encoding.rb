class RunLengthEncoding
  def self.encode(input)
    input.chars.chunk { |char| char }
         .map do |char, group|
           group.size == 1 ? char : "#{group.size}#{char}"
         end.join
  end

  def self.decode(input)
    input.scan(/\d+.|./).map do |group|
      group.size == 1 ? group : group[-1] * group.to_i
    end.join
  end
end
