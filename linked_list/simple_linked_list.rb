class Element
  attr_reader :datum, :next

  def initialize(data, next_element=nil)
    @datum = data
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  include Enumerable
  attr_reader :head

  def size
    count
  end

  def empty?
    head.nil?
  end

  def push(data)
    @head = Element.new(data, head)
  end

  def pop
    data = peek
    @head = head.next
    data
  end

  def peek
    head&.datum
  end

  def each
    return enum_for(:each) unless block_given?
    current_element = head
    while current_element
      yield(current_element)
      current_element = current_element.next
    end
    self
  end

  def to_a
    each_with_object([]) { |element, result| result << element.datum }
  end

  def reverse
    each_with_object(SimpleLinkedList.new) do |element, list|
      list.push(element.datum)
    end
  end

  def self.from_a(array)
    array ||= []
    list = new
    array.reverse_each { |num| list.push(num) }
    list
  end
end
