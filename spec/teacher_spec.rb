require './teacher'

describe Teacher do
  let(:teacher) { Teacher.new(30, 'Jane Smith', 'Math') }

  describe '#initialize' do
    it 'sets the age and name attributes' do
      expect(teacher.age).to eq(30)
      expect(teacher.name).to eq('Jane Smith')
    end

    it 'sets the specialization attribute' do
      expect(teacher.instance_variable_get(:@specialization)).to eq('Math')
    end

    it 'initializes the rentals attribute as an empty array' do
      expect(teacher.rentals).to eq([])
    end

    it 'sets a random id attribute' do
      expect(teacher.id).to be_between(1, 100).inclusive
    end
  end

  describe '#can_use_service?' do
    it 'returns true' do
      expect(teacher.can_use_service?).to eq(true)
    end
  end
end
