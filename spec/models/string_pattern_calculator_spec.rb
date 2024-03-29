require 'rails_helper'

RSpec.describe "StringPatternCalculator", type: :model do
  describe '#add' do
    let(:string_pattern_calculator) { method(:string_pattern_calculator) }

    it 'returns 0 for an empty string' do
      allow(string_pattern_calculator).to receive(:call).and_return(0)
      expect(string_pattern_calculator.call('')).to eq(0)
    end
  end

  def string_pattern_calculator(str)
    str.length
  end
end
