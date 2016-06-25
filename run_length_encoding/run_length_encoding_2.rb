class RunLengthEncoding
  def self.encode(input)
    count = 1
    (0..input.length - 1).each_with_object('') do |index, result|
      if input[index] == input[index + 1]
        count += 1
      else
        result << (count == 1 ? input[index] : "#{count}#{input[index]}")
        count = 1
      end
    end
  end

  def self.decode(input)
    count = ''
    (0..input.length - 1).each_with_object('') do |index, result|
      if /\d/ =~ input[index]
        count << input[index]
      else
        count = (count == '' ? 1 : count.to_i)
        result << input[index] * count
        count = ''
      end
    end
  end
end
