class CircularBuffer
  def initialize(size)
    @buffer = []
    @size = size
  end

  def read
    @buffer.empty? ? fail(BufferEmptyException) : @buffer.shift
  end

  def write(input)
    fail BufferFullException if full_buffer?
    @buffer.push(input) if input
  end

  def write!(input)
    return unless input
    @buffer.shift if full_buffer?
    @buffer.push(input)
  end

  def clear
    @buffer.clear
  end

  private

  def full_buffer?
    @buffer.count == @size
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end
