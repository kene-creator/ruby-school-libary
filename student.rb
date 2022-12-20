require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, classroom)
    super(age, name)
    self.classroom = (classroom)
  end

  def classroom=(new_classroom)
    @classroom = new_classroom
    new_classroom.students << self unless new_classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
