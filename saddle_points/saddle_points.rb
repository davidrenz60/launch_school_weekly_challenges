class Matrix
  attr_reader :rows, :columns

  def initialize(string)
    @rows = parse_rows(string)
    @columns = rows.transpose
  end

  def saddle_points
    result = []
    each { |x, y| result << [x, y] if saddle_point?(x, y) }
    result
  end

  private

  def parse_rows(string)
    string.split("\n").map(&:split).map { |row| row.map(&:to_i) }
  end

  def saddle_point?(x, y)
    rows[x].max == rows[x][y] &&
      columns[y].min == rows[x][y]
  end

  def each
    rows.each_with_index do |row, x|
      row.each_with_index do |_, y|
        yield(x, y)
      end
    end

    self
  end
end
