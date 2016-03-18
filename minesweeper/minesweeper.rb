class ValueError < StandardError; end

class Board
  MINE = '*'

  def self.transform(inp)
    fail ValueError, "Error, invalid input" unless valid_board?(inp)
    result = []
    inp.each_with_index do |line, index|
      row = ''
      line.chars.each_with_index do |square, square_number|
        if square != ' '
          row << square
        else
          row << find_mines(square_number, line, inp[index - 1], inp[index + 1])
        end
      end
      result << row
    end
    result
  end

  def self.find_mines(index, line, line_before, line_after)
    number_of_mines = 0
    number_of_mines += 1 if line[index + 1] == MINE
    number_of_mines += 1 if line[index - 1] == MINE
    number_of_mines += 1 if line_before[index] == MINE
    number_of_mines += 1 if line_before[index + 1] == MINE
    number_of_mines += 1 if line_before[index - 1] == MINE
    number_of_mines += 1 if line_after[index] == MINE
    number_of_mines += 1 if line_after[index + 1] == MINE
    number_of_mines += 1 if line_after[index - 1] == MINE
    return " " if number_of_mines == 0
    number_of_mines.to_s
  end

  def self.valid_board?(inp)
    same_length_line?(inp) && valid_borders?(inp) && valid_middle_lines?(inp)
  end

  def self.same_length_line?(inp)
    inp.map(&:size).uniq.count == 1
  end

  def self.valid_borders?(inp)
    first_line = inp[0]
    last_line = inp[-1]
    first_line.match(/^\+-*\+$/) && last_line.match(/^\+-*\+$/)
  end

  def self.valid_middle_lines?(inp)
    middle_lines = inp[1..-2]
    middle_lines.all? { |line| line.match(/^\|(\*|\ )*\|$/) }
  end
end
