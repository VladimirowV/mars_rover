require 'spec_helper'

describe Rover do
  describe '#check default postion' do
    let(:rover) { Rover.new('5 5', '1 1 N', 'L') }

    it 'faces north' do
      expect(rover.direction).to eq('N')
    end

    it 'start position' do
      expect(rover.position).to eq([1, 1])
    end
  end

  describe '#start the rover' do
    it 'move rover 1 step' do
      rover = Rover.new('5 5', '1 1 N', 'M')
      rover.print_info
      expect(rover.position).to eq [1, 2]
    end

    it 'rover should not out of bounds' do
      rover = Rover.new('5 5', '1 1 N', 'MMMMM')
      rover.print_info
      expect(rover.position).to eq [1, 5]
    end

    it 'should turn the rover left' do
      rover = Rover.new('5 5', '1 1 N', 'L')
      rover.print_info
      expect(rover.direction).to eq 'W'
      expect(rover.position).to eq [1, 1]
    end

    it 'should move and turn the rover right' do
      rover = Rover.new('5 5', '1 1 N', 'MR')
      rover.print_info
      expect(rover.direction).to eq 'E'
      expect(rover.position).to eq [1, 2]
    end
  end
end
