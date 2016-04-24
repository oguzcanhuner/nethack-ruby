describe Coordinate do
  let(:coord) { Coordinate.new(6, 9) }

  describe '#new' do
    it 'initializes with an x and y coordinate' do
      Coordinate.new(1, 1)
    end
  end

  describe 'coordinates' do
    it 'has an x and y coordinate' do
      expect(coord.x).to eql 6
      expect(coord.y).to eql 9
    end
  end

  describe '#eql?' do
    it 'returns true when two coordinates have the same x and y values' do
      expect(Coordinate.new(1, 3)).to eql Coordinate.new(1, 3)
    end
  end

  describe '#hash' do
    it 'creates a unique key to allow hash key comparison using coordinate values' do
      hash = {}
      hash[Coordinate.new(1, 2)] = 1

      expect(hash[Coordinate.new(1, 2)]).to eq 1
    end
  end

  describe '#up' do
    it 'returns a coordinate above the current coordinate' do
      expect(coord.up).to eql Coordinate.new(6, 8)
    end
  end
  describe '#down' do
    it 'returns a coordinate below the current coordinate' do
      expect(coord.down).to eql Coordinate.new(6, 10)
    end
  end
  describe '#left' do
    it 'returns a coordinate left of the current coordinate' do
      expect(coord.left).to eql Coordinate.new(5, 9)
    end
  end
  describe '#right' do
    it 'returns a coordinate right of the current coordinate' do
      expect(coord.right).to eql Coordinate.new(7, 9)
    end
  end
  describe '#topleft' do
    it 'returns a coordinate above the current coordinate' do
      expect(coord.topleft).to eql Coordinate.new(5, 8)
    end
  end
  describe '#topright' do
    it 'returns a coordinate above the current coordinate' do
      expect(coord.topright).to eql Coordinate.new(7, 8)
    end
  end
  describe '#bottomleft' do
    it 'returns a coordinate above the current coordinate' do
      expect(coord.bottomleft).to eql Coordinate.new(5, 10)
    end
  end
  describe '#bottomright' do
    it 'returns a coordinate above the current coordinate' do
      expect(coord.bottomright).to eql Coordinate.new(7, 10)
    end
  end

  describe '#adjacent?' do
    it 'returns true when coordinates are next to each other' do
      expect(Coordinate.new(1, 3)).to be_adjacent(Coordinate.new(1, 4))
      expect(Coordinate.new(1, 3)).to be_adjacent(Coordinate.new(2, 3))
    end

    it 'returns false when coordinates are not next to each other' do
      expect(Coordinate.new(1, 3)).not_to be_adjacent(Coordinate.new(5, 3))
    end

    it 'returns true when coordinates are diagonal' do
      expect(Coordinate.new(1, 3)).to be_adjacent(Coordinate.new(0, 2))
      expect(Coordinate.new(1, 3)).to be_adjacent(Coordinate.new(0, 4))
      expect(Coordinate.new(1, 3)).to be_adjacent(Coordinate.new(2, 2))
      expect(Coordinate.new(1, 3)).to be_adjacent(Coordinate.new(2, 4))
    end
  end

  describe '#up?' do
    it 'returns whether a coordinate is above another coordinate' do
      expect(coord).to be_up(Coordinate.new(1, 10))
      expect(coord).not_to be_up(Coordinate.new(10, 1))
    end
  end
  describe '#down?' do
    it 'returns whether a coordinate is below another coordinate' do
      expect(coord).to be_down(Coordinate.new(10, 1))
      expect(coord).not_to be_down(Coordinate.new(1, 10))
    end
  end
  describe '#right?' do
    it 'returns whether a coordinate is right of another coordinate' do
      expect(coord).to be_right(Coordinate.new(1, 10))
      expect(coord).not_to be_right(Coordinate.new(10, 1))
    end
  end
  describe '#left?' do
    it 'returns whether a coordinate is left of another coordinate' do
      expect(coord).to be_left(Coordinate.new(10, 1))
      expect(coord).not_to be_left(Coordinate.new(1, 10))
    end
  end

  describe '#direction_to_follow' do
    it 'returns a direction that will move closer to another coordinate' do
      expect(Coordinate.new(6, 7).direction_to_follow(coord)).to eq :down
      expect(Coordinate.new(6, 11).direction_to_follow(coord)).to eq :up
      expect(Coordinate.new(3, 9).direction_to_follow(coord)).to eq :right
      expect(Coordinate.new(8, 9).direction_to_follow(coord)).to eq :left
      expect(Coordinate.new(9, 15).direction_to_follow(coord)).to eq :topleft
      expect(Coordinate.new(2, 15).direction_to_follow(coord)).to eq :topright
      expect(Coordinate.new(9, 2).direction_to_follow(coord)).to eq :bottomleft
      expect(Coordinate.new(2, 2).direction_to_follow(coord)).to eq :bottomright
    end
  end
end
