require 'time'

class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(person:, book:, date:)
    @date = date
    @person = person
    @book = book
  end

  def assign_book
    @book.rentals << self unless @books.rentals.include? self
  end

  def assign_person
    @person.rentals << self unless @person.rentals.include? self
  end
end
