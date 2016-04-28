class Triangle
  def initialize(num_rows)
    @num_rows = num_rows
  end

  def rows
    @num_rows.times.with_object([]) do |_, triangle|
      triangle << next_row(triangle.last)
    end
  end

  private

  def next_row(arr)
    arr ||= []
    arr.each_index.with_object([1]) do |idx, result|
      result << arr[idx] + (arr[idx + 1] || 0)
    end
  end
end