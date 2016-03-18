class Series
  def initialize(str)
    @series = str
  end

  def slices(length)
    fail ArgumentError if length > @series.length
    @series.chars.map(&:to_i).each_cons(length).to_a
  end
end