class Element
  attr_reader :datum
  attr_accessor :next, :before

  def initialize(data, next_element=nil, before=nil)
    @datum = data
    @next = next_element
    @before = before
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  include Enumerable
  attr_reader :head, :tail, :size

  def initialize
    @size = 0
  end

  def empty?
    @head.nil?
  end

  def push(data)
    @size += 1
    element = Element.new(data)

    if empty?
      @head = element
      @tail = element
    else
      head.before = element
      element.next = head
      @head = element
    end
  end

  def pop
    @size -= 1
    data = @head.datum

    if head.tail?
      @head = nil
      @tail = nil
    else
      head.next.before = nil
      @head = head.next
    end
    data
  end

  def peek
    head ? head.datum : nil
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
    list = SimpleLinkedList.new
    each { |element| list.push(element.datum) }
    list
  end

  def self.from_a(array)
    array ||= []
    list = new
    array.reverse_each { |num| list.push(num) }
    list
  end
end
