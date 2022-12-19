class Person
  def initialize(name = 'unknown', age, parent_permission: true)
      @id = Random.rand(1..100) 
      @name = name
      @age = age
      @parent_permission = parent_permission
  end

  attr_reader :name, :id, :age

  def is_of_age? 
    return true if @age >= 18

    false
  end

  def can_use_service?
      is_of_age? || @parent_permission
  end
end
