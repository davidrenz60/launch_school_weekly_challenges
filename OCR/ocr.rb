class OCR
  PATTERNS = [" _ | ||_|",
              "     |  |",
              " _  _||_ ",
              " _  _| _|",
              "   |_|  |",
              " _ |_  _|",
              " _ |_ |_|",
              " _   |  |",
              " _ |_||_|",
              " _ |_| _|"]

  attr_reader :text

  def initialize(input)
    @text = input
  end

  def convert
    if single_digit?
      convert_single_digit(text)
    elsif multiple_digits_in_line?
      convert_line(text)
    elsif multiple_lines?
      convert_paragraph(text)
    end
  end

  private

  def single_digit?
    @text.length < 12
  end

  def convert_single_digit(text)
    format(text)
    PATTERNS.each_with_index do |pattern, idx|
      return idx.to_s if pattern == text
    end
    '?'
  end

  def format(text)
    text.prepend("   ") if text.start_with?("\n")
    text.gsub!(/_\n/, "_ \n")
    text.delete!("\n")
    text
  end

  def multiple_digits_in_line?
    @text.length > 11 && @text.count("\n") < 4
  end

  def multiple_lines?
    @text.count("\n") > 3
  end

  def convert_line(line)
    format(line)
    result = ''
    parse_line(line).each do |digit|
      result << convert_single_digit(digit)
    end

    result
  end

  def parse_line(line)
    line_array = line.chars
    number_of_digits = line_array.length / 9
    result = []
    number_of_digits.times { |n| result[n] = [] }

    3.times do
      result.each { |pattern| pattern << line.slice!(0, 3) }
    end
    result.map!(&:join)
  end

  def convert_paragraph(para)
    para_array = para.split(/\n\n/)
    para_array.map! { |line| convert_line(line) }.join(',')
  end
end
