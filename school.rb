class Person 

    def initialize( name = 'unknown', age, parent_permission: true)
        @id = Random.rand(1..100)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def name
        @name
    end

    def id 
        @id
    end

    def age
        @age
    end

    def is_of_age?
      if @age >= 18
        return true
      else
        return false
      end
    end

    def can_use_service?
        is_of_age? || @parent_permission
    end
end

class Student < Person

    def initialize(name, age, parent_permission: true, classroom)
        super(name, age, parent_permission: parent_permission)
    
        self.classroom = (classroom)
    end

    def play_hooky
        '¯\(ツ)/¯'
      end

end