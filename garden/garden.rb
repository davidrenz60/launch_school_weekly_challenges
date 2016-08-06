class Garden
  STUDENTS = %w(alice bob charlie david
                eve fred ginny harriet
                ileana joseph kincaid larry).freeze

  PLANTS = { "R" => :radishes,
             "C" => :clover,
             "G" => :grass,
             "V" => :violets }.freeze

  def initialize(diagram, students=STUDENTS)
    @students = students.sort.map(&:downcase)
    @diagram = diagram
    define_student_methods
  end

  def define_student_methods
    assign_plants.each do |student, plants|
      define_singleton_method(student) do
        plants
      end
    end
  end

  def assign_plants
    Hash[@students.zip(garden_setup)]
  end

  def garden_setup
    garden = []
    front, back = @diagram.split
    (front.size / 2).times do
      garden << front.slice!(0..1)
      garden << back.slice!(0..1)
    end
    garden.join.chars.map { |plant| PLANTS[plant] }
          .each_slice(4).to_a
  end
end
