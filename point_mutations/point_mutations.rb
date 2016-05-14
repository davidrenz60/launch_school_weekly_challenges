class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(test_strand)
    @strand.chars.each_with_index.reduce(0) do |distance, (letter, index)|
      break distance if test_strand[index].nil?
      letter == test_strand[index] ? distance : distance + 1
    end
  end
end
