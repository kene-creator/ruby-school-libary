require './capitalize_decorator'

describe CapitalizeDecorator do
  let(:nameable) { double('nameable') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the correct name of the decorated object' do
      allow(nameable).to receive(:correct_name).and_return('john smith')
      expect(decorator.correct_name).to eq('John smith')
    end
  end
end
