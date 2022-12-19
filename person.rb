require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  def initialize(name = 'unknown', age, parent_permission: true) # rubocop:todo Style/OptionalArguments
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  private def is_of_age? # rubocop:todo Naming/PredicateName
    return true if @age >= 18

    false
  end

  def can_use_service?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end

person = Person.new('maximilianus',22)
print person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
print capitalizedPerson.correct_name
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
print capitalizedTrimmedPerson.correct_name