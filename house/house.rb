class House
  def self.recite
    parts = House.new.pieces.reverse

    rhyme = ""
    (1..parts.size).each do |index|
      rhyme << "This is "

      parts.take(index).reverse_each do |line|
        if line[1]
          rhyme << line[0] + "\n" + line[1] + " "
        else
          rhyme << line[0] + ".\n"
        end
      end

      rhyme << "\n" unless index == parts.size
    end

    rhyme
  end

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
