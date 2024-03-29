require 'rails_helper'

RSpec.describe StringPattern do
  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(StringPattern.add('')).to eq(0)
    end

    it 'returns the number for a single number' do
      expect(StringPattern.add('1')).to eq(1)
    end

    it 'returns the sum for two numbers' do
      expect(StringPattern.add('1,5')).to eq(6)
    end

    it 'returns the sum for an unknown amount of numbers' do
      expect(StringPattern.add('1,2,3,4,5')).to eq(15)
    end

    it 'allows new lines between numbers' do
      expect(StringPattern.add("1\n2,3")).to eq(6)
    end

    it 'supports custom delimiters' do
      expect(StringPattern.add("//;\n1;2")).to eq(3)
    end

    it 'throws an exception for negative numbers' do
      expect { StringPattern.add('1,-2,-3') }.to raise_error('Negative numbers not allowed: -2,-3')
    end

    it 'ignores numbers greater than 1000' do
      expect(StringPattern.add('2,1001')).to eq(2)
    end
  end
end
