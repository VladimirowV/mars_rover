require 'spec_helper'

describe Plateau do
  describe '#check default postion' do
    let(:plateau) { Plateau.new }

    it ' default size' do
      expect(plateau.plateau).to eq([0, 0])
    end
  end
  describe '#check postion' do
    let(:plateau) { Plateau.new('5 5') }

    it 'grid size' do
      expect(plateau.plateau).to eq([5, 5])
    end

    it 'out of bounds' do
      expect(plateau.in_bounds?([10, 10])).to eq(false)
    end

    it 'in bounds' do
      expect(plateau.in_bounds?([1, 1])).to eq(true)
    end
  end
end
