def lowest_number(array)
  combinations = array.permutation.to_a
  combinations.map(&:join).map(&:to_i).min
end

p lowest_number([23, 550, 1, 80])
