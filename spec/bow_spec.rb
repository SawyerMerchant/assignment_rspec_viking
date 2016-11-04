require 'weapons/bow'

describe Bow do

  let(:crossbow) {Bow.new}

  describe '@arrows' do

    it 'has a readable arrow count' do
      expect(crossbow.arrows).to be_a(Integer)
    end

    it 'has 10 arrows by default' do
      expect(crossbow.arrows).to eq(10)
    end

    it 'can have a specific number of arrows at start' do
      expect(Bow.new(15).arrows).to eq(15)
    end

    it 'it uses up arrows' do
      crossbow.use
      expect(crossbow.arrows).to be(9)
    end

    it 'it can run out of arrows' do
      empty = Bow.new(0)
      expect{empty.use}.to raise_error("Out of arrows")
    end

  end
end
