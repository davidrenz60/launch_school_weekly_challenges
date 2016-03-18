class PigLatin
  def self.translate(string)
    sentence = string.split
    sentence.map! do |word|
      sound = word.slice!(/\A[xy](?=[aeiou])|\A[^aeiou]?qu|\A[^aeiouxy]*/) || ""
      word + sound + 'ay'
    end
    sentence.join(' ')
  end
end
