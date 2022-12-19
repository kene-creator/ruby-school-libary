class Person
  def initialize(name = 'unknown', age, parent_permission: true) # rubocop:todo Style/OptionalArguments
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  private_class_method def is_of_age? # rubocop:todo Naming/PredicateName
    return true if @age >= 18

    false
  end

  def can_use_service?
    is_of_age? || @parent_permission
  end
end
