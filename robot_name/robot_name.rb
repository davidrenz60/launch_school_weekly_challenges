class Robot
  attr_reader :name
  @@name_list = []

  def initialize
    @name = generate_name
    @@name_list << @name
  end

  def reset
    new_name = generate_name
    @@name_list << new_name
    @name = new_name
  end

  private

  def generate_name
    loop do
      name = (Array.new(2) { ('A'..'Z').to_a.sample }
              + [rand(100..999).to_s]).join
      break name unless @@name_list.include?(name)
    end
  end
end