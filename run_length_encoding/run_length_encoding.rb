class RunLengthEncoding
  def self.encode(input)
    i = 0
    count = 1
    output = ''
    while i < input.length
      if input[i] == input[i + 1]
        count += 1
      else
        output += count == 1 ? input[i] : "#{count}#{input[i]}"
        count = 1
      end
      i += 1
    end
    output
  end

  def self.decode(input)
    i = 0
    count = ''
    output = ''
    while i < input.length
      if /\d/ =~ input[i]
        count += input[i]
      else
        count = count.to_i
        count = 1 if count == 0
        output += input[i] * count
        count = ''
      end
      i += 1
    end
    output
  end
end
