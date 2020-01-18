require 'calculator'

describe Calculator do
  context '#sum' do
    it 'when positive numbers' do
      result = subject.sum(5, 5)
      expect(result).to eq(10)
    end
    it 'when negative nubers' do
      result = subject.sum(-5, -5)
      expect(result).to eq(-10)
    end
    it 'when positive and negative numbers' do
      result = subject.sum(5, -5)
      expect(result).to eq(0)
    end
  end

  context '#div' do
    it 'when positive numbers' do
      result = subject.div(5, 5)
      expect(result).to eq(1)
    end
    it 'when divisor is 0' do
      expect{subject.div(5, 0)}.to raise_error(ZeroDivisionError)
      expect{subject.div(5, 0)}.to raise_error(/divided/)
      
    end
  end
end

