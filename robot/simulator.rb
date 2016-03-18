class Robot
  attr_reader :bearing, :coordinates

  def initialize
    @bearing = :north
    @coordinates = [0, 0]
  end

  def orient(direction)
    fail ArgumentError unless [:north, :east, :south, :west].include?(direction)
    @bearing = direction
  end

  def at(x, y)
    @coordinates[0] = x
    @coordinates[1] = y
  end

  def turn_right
    @bearing = case bearing
               when :north then :east
               when :east then :south
               when :south then :west
               when :west then :north
               end
  end

  def turn_left
    @bearing = case bearing
               when :north then :west
               when :east then :north
               when :south then :east
               when :west then :south
               end
  end

  def advance
    coordinates[1] += 1 if bearing == :north
    coordinates[1] -= 1 if bearing == :south
    coordinates[0] += 1 if bearing == :east
    coordinates[0] -= 1 if bearing == :west
  end
end

class Simulator
  INSTRUCTIONS = { turn_left: 'L', turn_right: 'R', advance: 'A' }
  def instructions(command)
    command.chars.map { |letter| INSTRUCTIONS.key(letter) }
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, command)
    instructions(command).each do |com|
      robot.send(com)
    end
  end
end
