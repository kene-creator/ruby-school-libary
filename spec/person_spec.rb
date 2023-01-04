require './person'

describe Person do
  let(:person) { Person.new(25, 'John Smith') }

  describe '#initialize' do
    it 'sets the age and name attributes' do
      expect(person.age).to eq(25)
      expect(person.name).to eq('John Smith')
    end

    it 'sets the parent_permission attribute to true by default' do
      expect(person.instance_variable_get(:@parent_permission)).to eq(true)
    end

    it 'initializes the rentals attribute as an empty array' do
      expect(person.rentals).to eq([])
    end

    it 'sets a random id attribute' do
      expect(person.id).to be_between(1, 100).inclusive
    end
  end

  describe '#correct_name' do
    it 'returns the name attribute' do
      expect(person.correct_name).to eq('John Smith')
    end
  end

  describe '#can_use_service?' do
    it 'returns true if the person is of age or has parent permission' do
      expect(person.can_use_service?).to eq(true)
    end

    it 'returns false if the person is not of age and has no parent permission' do
      person.age = 17
      person.instance_variable_set(:@parent_permission, false)
      expect(person.can_use_service?).to eq(false)
    end
  end
end
