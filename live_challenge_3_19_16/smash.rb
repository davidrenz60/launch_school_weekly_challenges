def smash(string)
  array = string.chars.delete_if { |char| char.match(/[^a-zA-z^']/) }
  array.map { |char| char + " " }.join
end

puts smash("Hello, World")
