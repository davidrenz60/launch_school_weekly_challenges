class Robot
  @name_list = []

  def name
    @name ||= generate_name
  end

  def reset
    Robot.name_list.delete(@name)
    @name = nil
  end

  def self.name_list
    @name_list
  end

  private

  def generate_name
    name = (Array.new(2) { ('A'..'Z').to_a.sample } + [rand(000..999).to_s]).join
    if Robot.name_list.include?(name)
      name = generate_name
    else
      Robot.name_list << name
    end
    name
  end
end
