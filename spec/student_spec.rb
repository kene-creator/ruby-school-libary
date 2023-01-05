require './person'

describe Person do
  let(:student) { Person.new(18, 'John Smith') }

  describe '#initialize' do
    it 'sets the age and name attributes' do
      expect(student.age).to eq(18)
      expect(student.name).to eq('John Smith')
    end

    it 'sets the parent_permission attribute to true by default' do
      expect(student.instance_variable_get(:@parent_permission)).to eq(true)
    end

    it 'initializes the rentals attribute as an empty array' do
      expect(student.rentals).to eq([])
    end

    it 'sets a random id attribute' do
      expect(student.id).to be_between(1, 100).inclusive
    end
  end
end
