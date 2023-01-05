require './rental'

describe Rental do
  let(:person) { double('person') }
  let(:book) { double('book') }
  let(:rental) { Rental.new(person: person, book: book, date: '2022-01-01') }

  describe '#initialize' do
    it 'sets the person, book, and date attributes' do
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
      expect(rental.date).to eq('2022-01-01')
    end
  end
end
