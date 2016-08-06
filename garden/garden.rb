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
    plant_assignments.each do |student, plants|
      define_singleton_method(student) do
        plants
      end
    end
  end

  def plant_assignments
    Hash[@students.zip(garden_setup)]
  end

  def garden_setup
    garden = []
    rows = @diagram.split
    rows.each { |row| garden << row.slice!(0..1) } until rows[1].empty?
    garden.join.chars.map { |plant| PLANTS[plant] }.each_slice(4).to_a
  end
end
