class WordProblem
  OPERATIONS = {
    "plus" => :+,
    "minus" => :-,
    "multiplied" => :*,
    "divided" => :/
  }

  def initialize(question)
    @question = question
    @operations = question.scan(/\w+/).select { |word| OPERATIONS.include?(word) }
    @numbers = question.scan(/[-\d]+/).map(&:to_i)
  end

  def answer
    fail ArgumentError unless valid_question?

    result = @numbers.first
    @operations.each_with_index do |operation, index|
      result = result.send(OPERATIONS[operation], @numbers[index + 1])
    end
    result
  end

  private

  def valid_question?
    @question.downcase.start_with?("what is") &&
      !@operations.empty? &&
      !@numbers.empty?
  end
end