require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  def initialize(name = 'unknown', age, parent_permission: true) # rubocop:todo Style/OptionalArguments
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_service?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rental << rental
  end

  private

  def is_of_age? # rubocop:todo Naming/PredicateName
    return true if @age >= 18

    false
  end
end

person = Person.new('maximilianus', 22)
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
