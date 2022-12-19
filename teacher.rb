require './person'

class Teacher < Person

    def initialize(age, name, specialization)
        super(age, name)
        @specialization = specialization
    end

    def can_use_service?
        return true
    end
end