require 'spec_helper'

describe Player do
  let(:entity) { InteractiveEntity.new(map: double(:map)) }
  let(:player) { Player.new(entity) }

  describe '#to_s' do
    it "has a unique character" do
      expect(player.to_s).to eql " @ "
    end
  end

  describe '#health' do
    it 'has a health' do
      expect(player.health).to eql 20
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(player.name).to eql "Oz"
    end
  end
end
