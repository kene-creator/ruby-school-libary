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
    student_file = File.open("book.json")
    student_file_data = file.read
    student_data = JSON.parse(student_file_data)
    if !student_file_data 
      return
    end
    student_name = student_data['name']
    student_age = student_data['age']
    puts "[Student] Name: #{student_name}, Age: #{student_age}"
    puts "[Teacher] ID: #{t.id}, Name: #{t.name}"
  end

  def list_books
    file = File.open("book.json")
    file_data = file.read
    data = JSON.parse(file_data)
    if !file_data 
      return
    end
    title = data['title']
    author = data['author']
   puts "[Book] Title: #{title}, Author: #{author}"
  end

  def list_classrooms
    file = File.open("./data/classroom.json")
    file_data = file.read
    data = JSON.parse(file_data)
    print data
    if !file_data 
      return
    end
    label = data['classroom']['label']
    puts "[Classroom] Label: #{label}"
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
