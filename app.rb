require './student'
require './teacher'
require './book'
require './classroom'
require 'json'

class App
  attr_reader :books, :classrooms, :students, :teachers

  def initialize
    @students = []
    @books = []
    @teachers = []
    @rentals = []
    @classrooms = []
  end

  def list_people
    student_file = File.open("./data/student.json")
    student_file_data = student_file.read
    student_data = JSON.parse(student_file_data)
    @students << student_data
   

    teacher_file = File.open("./data/teacher.json")
    teacher_file_data = teacher_file.read
    teacher_data = JSON.parse(teacher_file_data)
    @teachers << teacher_data

    
    teacher_data.each {|hash| puts "[TEACHER] Name: #{hash["name"]} | Age: #{hash["age"]}"}
    student_data.each {|hash| puts "[STUDENT] Name: #{hash["name"]} | Age: #{hash["age"]}"}
  end

  def list_books
    file = File.open("./data/book.json")
    file_data = file.read
    data = JSON.parse(file_data)
    if !data 
      return
    end
    data.each {|hash| puts "[BOOK] Title: #{hash["title"]} | Author: #{hash["author"]}"}
  end

  def list_classrooms
    file = File.open("./data/classroom.json")
    file_data = file.read
    data = JSON.parse(file_data)
    if !data 
      return
    end
    data.each {|hash| puts "[CLASSROOM] Label: #{hash["classroom"]["label"]}"}
  end

  def create_student(age, name, classroom)
    student = Student.new(age, name, classroom)
    @students << student
    student
  end

  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, name, specialization)
    @teachers << teacher
    teacher
  end

  def create_book(title, author)
    book = Book.new(title: title, author: author)
    @books << book
    book
  end

  def create_rental(person, book)
    rental = Rental.new(person: person, book: book)
    @rentals << rental
    rental
  end

  def create_classroom(label)
    classroom = Classroom.new(label: label)
    @classrooms << classroom
    classroom
  end

  def find_rentals_by_person(person_id)
    (@rentals.select { |r| r.person.id == person_id }).each do |d|
      puts "[Rental] Date: #{d.date}, Title: #{d.book.title}, Borrower: #{d.person.name}"
    end
  end
end
