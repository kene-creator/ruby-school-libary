require 'time'

class Rental
  attr_accessor :person, :book, :date

  def initialize(person, book)
    @date = DateTime.now.strftime('%Y/%m/%d %H:%M')

    @book.rentals << self

    @person = person

    @book.rentals << self

    @book = book
  end
end
