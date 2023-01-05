require './book'

# Test on Book Class
describe Book do
  let(:book) { Book.new(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald') }
  describe '#initialize' do
    it 'sets the title and author attributes' do
      book = Book.new(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald')
      expect(book.title).to eq('The Great Gatsby')
      expect(book.author).to eq('F. Scott Fitzgerald')
    end

    it 'initializes the rentals attribute as an empty array' do
      book = Book.new(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald')
      expect(book.rentals).to eq([])
    end
    it 'adds a new rental to the rentals array' do
      rental = book.add_rental('person', 'book', '2022-01-01')
      expect(book.rentals).to eq(rental)
    end
  end
end
