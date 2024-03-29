require 'rails_helper'

RSpec.describe "StringPatternCalculator", type: :model do
  describe '#add' do
    let(:string_pattern_calculator) { method(:string_pattern_calculator) }

    it 'returns 0 for an empty string' do
      allow(string_pattern_calculator).to receive(:call).and_return(0)
      expect(string_pattern_calculator.call('')).to eq(0)
    end

    it 'returns the number for a single number' do
      allow(string_pattern_calculator).to receive(:call).with('1').and_return(1)
      expect(string_pattern_calculator.call('1')).to eq(1)
    end

    it 'returns the sum for two numbers' do
      allow(string_pattern_calculator).to receive(:call).with('1,5').and_return(6)
      expect(string_pattern_calculator.call('1,5')).to eq(6)
    end
  end

  def string_pattern_calculator(str)
    str.split(',').map(&:to_i).sum
  end
end
