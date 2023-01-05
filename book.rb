require './rental'
require 'date'

class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title:, author:)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date, book)
    rental = Rental.new(person: person, date: date, book: book)
    @rentals << rental
  end
end
