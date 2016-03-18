class School
  attr_accessor :db

  def initialize
    @db = Hash.new
  end

  def empty?
    @db.empty?
  end

  def add(name, grade)
    db[grade] = [] unless db[grade]
    db[grade] << name
  end

  def to_h
    sorted_values = db.map { |k, v| [k, v.sort] }.sort
    Hash[sorted_values]
  end

  def grade(num)
    db[num] = [] unless db[num]
    @db[num].sort
  end
end
