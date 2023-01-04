require './book'

# Test on Book Class
describe Book do
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
  end
end
