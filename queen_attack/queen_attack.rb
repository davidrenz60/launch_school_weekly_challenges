class Queens
  WHITE_MARKER = 'W'
  BLACK_MARKER = 'B'

  attr_reader :white, :black

  def initialize(white: [0, 3], black: [7, 3])
    fail ArgumentError if white == black
    @white = white
    @black = black
  end

  def to_s
    board = Array.new(8) { Array.new(8, '_') }
    board[white[0]][white[1]] = WHITE_MARKER
    board[black[0]][black[1]] = BLACK_MARKER

    board.map { |row| row.join(" ") }.join("\n")
  end

  def attack?
    same_row? || same_column? || same_diagonal?
  end

  private

  def same_row?
    white[0] == black[0]
  end

  def same_column?
    white[1] == black[1]
  end

  def same_diagonal?
    white[0] + white[1] == black[0] + black[1] ||
      white[0] - black[0] == white[1] - black[1]
  end
end
