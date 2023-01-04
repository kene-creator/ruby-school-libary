require './trim_decorator'

describe TrimmerDecorator do
  let(:nameable) { double('nameable') }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  describe '#correct_name' do
    it 'trims the correct name of the decorated object to a maximum of 10 characters' do
      allow(nameable).to receive(:correct_name).and_return('John Smithh')
      expect(decorator.correct_name).to eq('John Smith')
    end
  end
end
