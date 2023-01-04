require './student'

describe Student do
  let(:classroom) { double('classroom') }
  let(:student) { Student.new(18, 'John Smith', classroom) }

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

    it 'sets the classroom attribute' do
      expect(student.classroom).to eq(classroom)
    end
  end
end
