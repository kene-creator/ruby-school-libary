require './user_prompt'
require 'json'

class Processor < UserPrompt
  def initialize(app)
    super()
    @app = app
  end

  private

  def reject_choice?(choice, min: 1, max: 2)
    choice.nil? || choice < min || choice > max
  end
end

class CreateProcessor < Processor
  def process(choice)
    case choice
    when 1
      create_person
    when 2
      create_classroom
    when 3
      create_book
    else
      create_rental
    end
  end

  private

  def resources?
    equipped = true
    if @app.students.empty? && @app.teachers.empty?
      puts 'No people available'
      equipped = false
    end

    if @app.books.empty?
      puts 'No books available'
      equipped = false
    end

    equipped
  end

  def list_people_with_index
    si = @app.students.size
    @app.students.each_with_index { |s, i| puts "#{i + 1}. #{s.name}" }
    @app.teachers.each_with_index { |t, i| puts "#{i + si + 1}. #{t.name}" }
  end

  def create_teacher(age, name)
    specialization = nil_prompt('specialization: ', :str)
    return if specialization.nil?

    teacher = @app.create_teacher(age, name, specialization)
    if File.exist?('./data/teacher.json')
      data = { "name" => teacher.name, "age" => teacher.age}
      json_data = data
      file = File.open('./data/teacher.json')
        if file.size.zero?
          teacher_d = [json_data]
        else
        teacher_d = JSON.parse(File.read('./data/teacher.json'))
        teacher_d << json_data
        end
      file.close

      addfile = File.open('./data/teacher.json', 'w')
      addfile.write(JSON.generate(teacher_d))
      addfile.close
    end
    puts 'Teacher created successfully!'
    teacher
  end

  def create_student(age, name)
    puts 'Available Classrooms'
    puts '0. Create new'
    @app.classrooms.each_with_index { |c, i| puts "#{i + 1}. #{c.label}" }
    choice = prompt(suffix: 'classroom: ')
    return if reject_choice?(choice, min: 0, max: @app.classrooms.size)

    # noinspection RubyNilAnalysis
    classroom = choice.zero? ? create_classroom : @app.classrooms[choice - 1]
    return if classroom.nil?

    student = @app.create_student(age, name, classroom)
    if File.exist?('./data/student.json')
      data = { "name" => student.name, "age" => student.age }
      json_data = data
      file =File.open('./data/student.json')
        if file.size.zero?
          student_d = [json_data]
        else
        student_d = JSON.parse(File.read('./data/student.json'))
        student_d << json_data
        end
      file.close

      addfile = File.open('./data/student.json', 'w')
      addfile.write(JSON.generate(student_d))
      addfile.close
    end
    puts 'Student created successfully!'
    student
  end

  def create_person
    puts 'Which person?'
    list_with_index(%w[Student Teacher])
    choice = prompt(suffix: 'person: ')
    return if reject_choice?(choice)

    age = nil_prompt('age: (age varies from 1 up to 100) ')
    return if reject_choice?(age, max: 100)

    name = nil_prompt('name: ', :str)
    return if name.nil?

    choice == 1 ? create_student(age, name) : create_teacher(age, name)
  end

  def create_classroom
    label = nil_prompt('label: ', :str)
    return if label.nil?

    classroom = @app.create_classroom(label)
    if File.exist?('./data/classroom.json')
      data = {"classroom" => classroom.label }
      json_data = data
      file =File.open('./data/classroom.json')
        if file.size.zero?
          classroom_d = [json_data]
        else
        classroom_d = JSON.parse(File.read('./data/classroom.json'))
        classroom_d << json_data
        end
      file.close

      addfile = File.open('./data/classroom.json', 'w')
      addfile.write(JSON.generate(classroom_d))
      addfile.close
    end
    puts 'Classroom created successfully!'
    classroom
  end

  def create_book
    title = nil_prompt('title: ', :str)
    return if title.nil?

    author = nil_prompt('author: ', :str)
    return if author.nil?

    book = @app.create_book(title, author)
    if File.exist?('./data/book.json')
      data = { "title" => book.title, "author" => book.author}
      json_data = data
      file = File.open('./data/book.json')
        if file.size.zero?
          book_d = [json_data]
        else
          book_d = JSON.parse(File.read('./data/book.json'))
        book_d << json_data
        end
      file.close

      addfile = File.open('./data/book.json', 'w')
      addfile.write(JSON.generate(book_d))
      addfile.close
    end
    puts 'Book created successfully!'
    book
  end

  def create_rental
    return unless resources?

    puts "Who's borrowing?"
    list_people_with_index
    pc = prompt(suffix: 'person: ')
    ss = @app.students.size
    return if reject_choice?(pc, max: ss + @app.teachers.size)

    puts 'Which book?'
    @app.books.each_with_index { |b, i| puts "#{i + 1}. #{b.title}" }
    bc = prompt(suffix: 'book: ')
    return if reject_choice?(bc, max: @app.books.size)

    person = pc > ss ? @app.teachers[pc - ss - 1] : @app.students[pc - 1]
    rental = @app.create_rental(person, @app.books[bc - 1])
    if File.exist?('./data/rental.json')
      data = { "person" => rental.person}
      json_data = data
      file =File.open('./data/rental.json')
        if file
          rental = [json_data]
        else
        rental = JSON.parse(File.read('./data/rental.json'))
        rental << json_data
        end
      file.close

      addfile = File.open('./data/rental.json', 'w')
      addfile.write(JSON.generate(rental))
      addfile.close
    end
    puts 'Rental created successfully!'
    rental
  end
end

class ListProcessor < Processor
  def process(choice)
    case choice
    when 5
      list_books
    when 6
      list_people
    when 7
      list_classrooms
    else
      list_rentals_by_person
    end
  end

  private

  def list_books
    @app.list_books
  end

  def list_people
    @app.list_people
  end

  def list_classrooms
    @app.list_classrooms
  end

  def list_rentals_by_person
    puts 'Whose rentals do you want to retrieve?'
    @app.list_people
    choice = nil_prompt('person ID: ')
    return if reject_choice?(choice, max: 100)

    @app.find_rentals_by_person(choice)
  end
end
