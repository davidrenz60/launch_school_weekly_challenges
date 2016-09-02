# class BeerSong
#   def lyrics
#     verses(99, 0)
#   end
#
#   def verse(num)
#     make_song(num)
#   end
#
#   def verses(start, finish)
#     start.downto(finish).map { |num| verse(num) }.join("\n")
#   end
#
#   def make_song(num)
#     case num
#     when 3..99 then recite_verse(num)
#     when 2 then recite_verse_two
#     when 1 then recite_verse_one
#     when 0 then recite_verse_zero
#     end
#   end
#
#   def recite_verse(num)
#     "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
#       "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
#   end
#
#   def recite_verse_two
#     "2 bottles of beer on the wall, 2 bottles of beer.\n" \
#       "Take one down and pass it around, 1 bottle of beer on the wall.\n"
#   end
#
#   def recite_verse_one
#     "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#       "Take it down and pass it around, no more bottles of beer on the wall.\n"
#   end
#
#   def recite_verse_zero
#     "No more bottles of beer on the wall, no more bottles of beer.\n" \
#       "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#   end
# end
class VerseZero
  def verse(_)
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

class VerseOne
  def verse(_)
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end
end

class VerseTwo
  def verse(_)
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end

class Verse
  def verse(num)
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
  end
end

class BeerSong
  VERSES = [VerseZero, VerseOne, VerseTwo].freeze

  def verse(num)
    VERSES.fetch(num, Verse).new.verse(num)
  end

  def verses(start, finish)
    start.downto(finish).map { |num| verse(num) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end
